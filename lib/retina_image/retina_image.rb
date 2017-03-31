module RetinaImage
  class Tag
    def retina_tag(source, options = {})
      options.reverse_merge!(include_srcsets: true)

      # if options[:include_srcsets] != true
      # need to cast to bool incase truthy/falsey strings are passed
      return image_tag unless options.delete(:include_srcsets).to_bool

      srcset = srcset_from_source(source)
      options[:srcset] = srcset.keys.map { |k| "#{srcset[k]} #{k}" }.join(', ')
      options.reverse_merge!(alt: alt(source))
      image_tag(srcset["1x"], options)
    end

    private def split_path(source)
      [
          File.dirname(source),
          filename(source),
          File.extname(source)
      ]
    end

    private def filename(source)
      File.basename(source, '.*')
    end

    private def alt(source)
      filename(source).titleize
    end

    private def build_image_path(dirname, filename)
      path = (dirname == '.' ? filename : File.join(dirname, filename))
      image_path(path)
    end
  end
end
