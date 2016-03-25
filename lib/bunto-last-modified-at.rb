
module Bunto
  module LastModifiedAt
    autoload :VERSION, 'bunto-last-modified-at/version'
    autoload :Executor, 'bunto-last-modified-at/executor'
    autoload :Determinator, 'bunto-last-modified-at/determinator'
    autoload :Generator, 'bunto-last-modified-at/generator'
    autoload :Tag, 'bunto-last-modified-at/tag'

    Generator ; Tag

    PATH_CACHE = {}
  end
end
