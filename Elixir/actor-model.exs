defmodule HiThere do
  @moduledoc false
  def hello do
    receive do
      {:hello, pid} ->
        IO.puts("Receiving a HI message from #{inspect pid}")
      {:child, _} ->
        child = spawn(&HiThere.hello/0)
        child_pid = self()
        IO.puts("New childprocess #{inspect child_pid} created")
        send(child, {:hello, self()})
    end
    hello()
  end
end

# Creating two processes
actor = spawn(&HiThere.hello/0)
actor2 = spawn(&HiThere.hello/0)
# Main Process PID
main_pid = self()
IO.puts("\nMain Process pid #{inspect main_pid}\n\n")

# Send messages to process
send(actor, {:hello, main_pid})
send(actor, {:child, main_pid})
send(actor2, {:child, main_pid})
send(actor2, {:hello, main_pid})
:timer.sleep(1000)
