class RetinaImage
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

  private def srcset_from_source(source)
    dir, file, extension = split_path(source)

    (1..3).each_with_object({}) do |i, srcset|
      scale = "#{i}x"
      srcset[scale] = build_image_path(dir, "#{file}_#{scale}#{extension}")
    end
  end

  private def split_path(source)
    [
        File.dirname(source),
        File.basename(source, '.*'),
        File.extname(source)
    ]
  end

  private def build_image_path(dirname, filename)
    asset_path = (dirname == '.' ? filename : File.join(dirname, filename))
    image_path(asset_path)
  end
end
