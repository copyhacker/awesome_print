# Copyright (c) 2010 Michael Dvorkin
#
# Awesome Print is freely distributable under the terms of MIT license.
# See LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
class Object
  methods.grep(/methods$/) do |name|
    next if name.to_s.include? 'instance' # Instance methods are trapped in Class.
    define_method name do |*args|
      methods = super(*args)
      # And now the evil part :-)
      methods.instance_variable_set('@__awesome_methods__', self)
      methods.sort!
    end
  end
end