module ApplicationHelper
  def flash_classes(type)
    base_classes = "px-4 py-3 rounded-md text-sm font-medium mb-4"

    case type.to_sym
    when :notice, :success
      "#{base_classes} bg-green-100 text-green-800 border border-green-200"
    when :alert, :error
      "#{base_classes} bg-red-100 text-red-800 border border-red-200"
    when :warning
      "#{base_classes} bg-yellow-100 text-yellow-800 border border-yellow-200"
    else
      "#{base_classes} bg-blue-100 text-blue-800 border border-blue-200"
    end
  end

  def label_class
    "block text-sm font-medium text-gray-700 mb-1"
  end

  def input_class
    "appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-sky-500 focus:border-sky-500 text-sm"
  end

  def button_class
    "w-full flex justify-center py-2 px-4 border border-transparent rounded-full shadow-sm text-sm font-bold text-white bg-sky-500 hover:bg-sky-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-sky-500 cursor-pointer transition ease-in-out duration-300"
  end

  def link_button_class
    "font-medium text-sky-500 hover:text-sky-600 transition ease-in-out duration-300"
  end

  def profile_image(user, options = {})
    return nil unless user

    size = case options[:size]
    when "large"
             "w-20 h-20"
    when "small"
             "w-10 h-10"
    else
             "w-14 h-14"
    end

    classes = "#{size} flex-shrink-0 rounded-full border-2 border-white"

    if user.profile_image.attached?
      image_tag user.profile_image, class: classes
    else
      image_tag "https://doodleipsum.com/700/avatar-5?bg=3D27F6&i=f339578a64040310d3eb5bd82b550627", class: classes
    end
  end
end
