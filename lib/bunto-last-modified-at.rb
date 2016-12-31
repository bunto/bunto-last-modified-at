
module Bunto
  module LastModifiedAt
    autoload :VERSION, 'bunto-last-modified-at/version'
    autoload :Executor, 'bunto-last-modified-at/executor'
    autoload :Determinator, 'bunto-last-modified-at/determinator'
    autoload :Tag, 'bunto-last-modified-at/tag'
    autoload :Hook, 'bunto-last-modified-at/hook'

    Tag ; Hook

    PATH_CACHE = {}
  end
end
