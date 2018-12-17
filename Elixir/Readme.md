# Installationsanleitung Elixir

## Windows
1. Web-Installer [downloaden](https://repo.hex.pm/elixir-websetup.exe)
2. Ausführen, Erlang VM und Elixir werden installiert

![Elixir Setup](assets/ElixirSetup.png)

![Erlang wird mitinstalliert](assets/ErlangInstallation.png)

3. (optional) Um iex & elixir mit Powershell benutzen zu können:
* PowerShell öffnen
* `notepad $PROFILE` ausführen
* folgenden Text zu Profil hinzufügen:

```Powershell
Remove-Item alias:\iex -Force
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
```

## Mac OS X
1. Homebrew installieren mit
```Terminal
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


![Was das Skript tut](assets/homebrew_installation.png)

2. Elixir über Homebrew installieren
```Terminal
brew install elixir
```

![brew install elixir](assets/brew_install_elixir.png)

![elixir version](assets/elixir--version.png)

## Unix
### Arch Linux
```Terminal
pacman -S elixir
```
### Ubuntu/Debian
```Terminal
# Add Erlang Solutions repo
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
# Install Erlang VM
sudo apt-get install esl-erlang
# Install Elixir
sudo apt-get install elixir
```
### Fedora 22
```Terminal
dnf install elixir
```

Weitere Hilfe kann auf der folgende Seite gefunden werden: https://elixir-lang.org/install.html

# Elixir code ausführen
```Terminal
elixir <filename>.exs
# z.B. 
# elixir comprehensions_into.exs
```

# Elixir Modul im Interaktiven Shell importieren
Wie folgt kann ein Modul im interaktiven Elixir Shell importiert werden (zum Beispiel für macros/macros.exs):
```Terminal
iex <filename>.exs
```
