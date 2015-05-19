# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
   #include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  version :jumbo, if: :is_human? do
    #was resize to fit
    resize_to_limit(1000,1000)
  end

  version :thumb, if: :is_human? do
    process crop: [:avatar, 1000, 1000]  ## Crops this version based on original image
    resize_to_limit(100,100)
  end


  version :small, if: :is_human? do
    process crop: [:avatar, 1000, 1000]  ## Crops this version based on original image
    resize_to_limit(34,34)
  end

  version :medium, if: :is_human? do
    process crop: [:avatar, 1000, 1000]  ## Crops this version based on original image
    resize_to_limit(139,139)
  end



  version :base, if: :is_event? do
    resize_to_limit(1000,1000)
  end


  version :large_image, if: :is_event? do
    process crop: [:avatar, 1000, 1000]  ## Crops this version based on original image
    resize_to_fill(1351,477)
  end


  version :medium_image, from_version: :large_image, if: :is_event? do
    #process crop: [:avatar, 1000, 1000]  ## Crops this version based on original image
    resize_to_fill(194,153)
  end

  version :medium_image_edit, if: :is_event_image_edit? do
    process crop: [:avatar, 1000, 1000]  ## Crops this version based on original image
    resize_to_fill(194,153)
  end


  version :background_base, if: :is_background? do
    resize_to_limit(1000,1000)
  end

  version :background, if: :is_background? do
    process crop: [:avatar, 1000, 1000] 
    resize_to_fill(360,175)
  end
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    if model.name == 'event_edit'
      "uploads/event/#{model.id}"
    else
      "uploads/#{model.name.to_s.underscore}/#{model.id}"
    end
  end

  def filename
    "#{model.status}#{original_filename}" if original_filename
  end


  private 

    def is_human? picture
      if model.name == "user"
        return true
      else 
        return false
      end
    end

    def is_event? picture
      if model.name == "event"
        return true
      else 
        return false
      end
      
    end

    def is_background? picture
      if model.name == "background"
        return true
      else 
        return false
      end
    end

    def is_event_image_edit? picture
      if model.name == "event_edit"
        return true
      else 
        return false
      end
    end
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
   #def filename
     #original_filename if original_filename
   #end

end
