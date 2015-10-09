class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  version :size_960_4x3 do
    process resize: [960, 719]
  end
  version :size_960_16x9 do
    process resize: [960, 539]
  end

  version :size_810_4x3, from_version: :size_960_4x3 do
    process resize: [810, 607]
  end
  version :size_810_16x9, from_version: :size_960_16x9 do
    process resize: [810, 455]
  end

  version :size_590_4x3, from_version: :size_810_4x3  do
    process resize: [590, 442]
  end
  version :size_590_16x9, from_version: :size_810_16x9 do
    process resize: [590, 331]
  end

  version :size_460_4x3, from_version: :size_590_4x3 do
    process resize: [460, 345]
  end
  version :size_460_16x9, from_version: :size_590_16x9 do
    process resize: [460, 258]
  end

  version :size_380_4x3, from_version: :size_460_4x3 do
    process resize: [380, 285]
  end
  version :size_380_16x9, from_version: :size_460_16x9 do
    process resize: [380, 213]
  end

  version :size_300_4x3, from_version: :size_380_4x3 do
    process resize: [300, 225]
  end
  version :size_300_16x9, from_version: :size_380_16x9 do
    process resize: [300, 168]
  end

  version :size_220_4x3, from_version: :size_300_4x3 do
    process resize: [220, 165]
  end
  version :size_220_16x9, from_version: :size_300_16x9 do
    process resize: [220, 123]
  end

  version :size_80_4x3, from_version: :size_220_4x3 do
    process resize: [80, 60]
  end
  version :size_80_16x9, from_version: :size_220_16x9 do
    process resize: [80, 45]
  end

  version :icon, from_version: :size_80_4x3 do
    process resize: [50, 28]
  end

  def store_dir
    now = Time.now
    "images/#{now.year}/#{now.month}/#{model.id}/"
  end

  def filename
    if model.custom_filename
      "#{model.custom_filename.parameterize}.#{file.extension}"
    else
      original_filename
    end
  end

  private

  def resize(width, height)
    manipulate! do |img|
      img.resize_to_fill!(width, height)
    end
  end
end
