# RetinaImage
Retina Image is a simple retina image tag that supports high resolution images using assets pipeline.
It will find the suitable image for any resolution for you.
Also, this gem does not override your original image_tag.


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'retina_image'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install retina_image
```

## Usage
Include module in your application helper or any helper in your app
```ruby
include RetinaImage::ViewHelpers
```

Add images as `example_1x.png`, `example_2x.png`, `example_3x.png` to your asset pipeline
then add below code to your view.
```ruby
<%= retina_image_tag 'example.png' %>
```
Output
```html
<img srcset="/example_1x.png 1x, /example_2x.png 2x, /example_3x.png 3x" alt="Example" src="/example_1x.png">
```

Add other options. For example
```ruby
<%= retina_image_tag 'example.png', alt: 'Example Wow' %>
```
Output
```html
<img srcset="/example_1x.png 1x, /example_2x.png 2x, /example_3x.png 3x" alt="Example Wow" src="/example_1x.png">
```

Disable retina image tag by adding `include_srcsets: false`
```ruby
<%= retina_image_tag 'example.png', include_srcsets: false%>
```
Output
```html
<img src="/example_1x.png" alt="Example" >
``` 

## Contributing
Create pull requests. Raise issues.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
