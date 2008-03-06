#{mods = ''; module_name.split('::').each_with_index {|mod, i| mods << 'module ' << mod << ' #:nodoc' << $/ << ('  ' * i)}; mods}module Version #:nodoc:
    MAJOR = 0
    MINOR = 1
    TINY  = 0

    STRING = [MAJOR, MINOR, TINY].join('.')
  end
#{ends = ''; module_name.split('::').each {|mod| ends << 'end' << $/ }; ends;}