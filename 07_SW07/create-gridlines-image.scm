; GIMP Skript das ein konfigurierbares Gitternetz im GIMP zeichnet
; Im GIMP und im Menu registrieren
(script-fu-register 
 "script-fu-create-gridlines" ; Funktionsname
 "New gridlines"	; Menu Punkt
 "Illustrates the structure of a GIMP script" ; Beschreibung
 "Roger Diehl"          ; Autor
 "2018, HSLU - I"     ; Copyright Notiz
 "October 2018"         ; Erstellungsdatum
 ""                     ; Bild Typ des Skript - "" heisst, es muss kein Bild geladen sein
 ; aktuelle Parameter von script-fu-create-gridlines
 SF-ADJUSTMENT "Image width" '(200 10 10000 1 1 0 1) ; drawable_width - default 200
 SF-ADJUSTMENT "Image height" '(200 10 10000 1 1 0 1); drawable_height - default 200
 SF-ADJUSTMENT "Spacing" '(20 2 100 1 1 0 1)         ; spacing - default 20
 SF-BRUSH "Brush" '("Circle (01)" 100.0 1 0)         ; brush - default Circle (01)
 SF-ADJUSTMENT "Brush Size" '(4 1 100 1 10 0 1)
 SF-COLOR "Background" '(255 255 255)                ; background color - default black
 SF-COLOR "Foreground" '(0 0 0)                      ; foreground color - default white
 SF-TOGGLE "Transparent Layer" FALSE                 ; transparent - default FALSE
 SF-TOGGLE "Horizontal lines" TRUE                   ; horizontal - default TRUE
 SF-TOGGLE "Vertical lines" FALSE                    ; vertical - default FALSE
 SF-TOGGLE "Dashed lines" FALSE                      ; dashed - default FALSE
 )
(script-fu-menu-register "script-fu-create-gridlines"
	"<Image>/File/Create/Gridlines")

; Das eigentliche Skript
(define (script-fu-create-gridlines drawable_width drawable_height spacing brush brush-size background foreground transparent horizontal vertical dashed)
	
	(gimp-context-push)
	(let* (
				; Grundeinstellungen - Farbe, Breite, Höhe, Ebene...
				(color 0)
				(image (car(gimp-image-new drawable_width drawable_height RGB)))
				(layer (car(gimp-layer-new image drawable_width drawable_height RGBA-IMAGE "Netzebene" 100 NORMAL-MODE)))
				(layer_width (car(gimp-drawable-width layer)))
				(layer_height (car(gimp-drawable-height layer)))
				; Anfangs- und Endpunkt einer Linie definieren x1, y1, x2, y2
				(point (cons-array 4 'double))
				(invert FALSE)
				)
		; Gimp Kontext sezten - Transparenz, Hintergrund, Vordergrund, Pinsel, Füllfarbe, Ebene...
		(if(= transparent TRUE)
			(set! color TRANSPARENT-FILL)
			(set! color BACKGROUND-FILL)
			)
		(gimp-context-set-background background)
		(gimp-context-set-foreground  foreground)
		(gimp-context-set-brush (car brush))
		(gimp-context-set-brush-size brush-size)
		(gimp-drawable-fill layer color)
		(gimp-image-add-layer image layer -1)
		
		; Demo zum Zeichnen einer Linie
		(define (draw-line x1 y1 x2 y2)
			; Variablen x1, y1, x2, y2 den Anfangs- und Endpunkten der Linie zuordnen
			(aset point 0 x1)
			(aset point 1 y1)
			(aset point 2 x2)
			(aset point 3 y2)
			; Linie zeichnen
			(gimp-pencil layer 4 point))
		
		; Horizontale Linie
		(define (draw-horizontal-line y-Position)
			(cond
				((< y-Position layer_height) 
					(draw-line 0 y-Position layer_width y-Position)
					(draw-horizontal-line (+ y-Position spacing))
					)
				)
			)

		; Vertikale Linie
		(define (draw-vertical-line x-Position)
			(cond
				((< x-Position layer_width) 
					(draw-line x-Position 0 x-Position layer_height)
					(draw-vertical-line (+ x-Position spacing)))
				)
			)

		; Horizontal gestrichelt
		(define (draw-horizontal-line-dashed y-Position x-Position)
			(cond
				((< y-Position layer_height)
					(if (<= x-Position layer_width)
						(and
							(draw-line x-Position y-Position (+ x-Position spacing) y-Position)
							(draw-horizontal-line-dashed y-Position (+ x-Position (* 2 spacing)))
						)
						(draw-horizontal-line-dashed (+ y-Position spacing) 0)
					)
				)
			)
		)

		; Vertikal gestrichelt
		(define (draw-vertical-line-dashed y-Position x-Position)
			(cond
				((< x-Position layer_width)
					(if (<= y-Position layer_height)
						(and
							(draw-line x-Position y-Position x-Position (+ y-Position spacing))
							(draw-vertical-line-dashed (+ y-Position (* 2 spacing)) x-Position)
						)
						(draw-vertical-line-dashed 0 (+ x-Position spacing))
					)
				)
			)
		)

		; Abfragen der Toggles
		(cond
			((and (eq? vertical FALSE) (eq? horizontal TRUE)) 
				(if (eq? dashed FALSE)
					(draw-horizontal-line spacing)
					(draw-horizontal-line-dashed spacing 0)
				)
			)
			((and (eq? vertical TRUE) (eq? horizontal FALSE)) 
				(if (eq? dashed FALSE)
					(draw-vertical-line spacing)
					(draw-vertical-line-dashed spacing 0)
				)
			)
			((and (eq? vertical TRUE) (eq? horizontal TRUE)) 
				(if (eq? dashed FALSE)
					(and
						(draw-horizontal-line spacing)
						(draw-vertical-line spacing)
					)
					(and 
						(draw-horizontal-line-dashed 0 spacing)
						(draw-vertical-line-dashed 0 spacing)
					)
				)
			)
		)

		; Bild anzeigen
		(gimp-display-new image)
		(gimp-context-pop)
		(gimp-displays-flush)
	)
)