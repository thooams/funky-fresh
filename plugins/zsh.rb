class Zsh < Plugin

  def handle_command(p)
    p.command(:zf) do |c|
      c.syntax "zf [options]"
      c.description "Action on zshfiles"
      c.option 'update_modules', '-u', '--update', 'Update modules of zsh'
      c.action do |args, options|
        execute options
      end
    end
  end

  def execute(options)
    command = []
    command <<  "cd #{ Plugin::APPDIR }/zshfiles"
    command <<  "./update.sh" if options["update_modules"]
    command <<  "$SHELL"
    system command.join(' && ')
  end

end
