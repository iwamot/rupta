class Rupta
  module Helper
    module UriExtractProcessor
      class Default
        def match(name)
          '[^/.]*'
        end
      end
    end
  end
end
