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
    "appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-sky-500 focus:border-sky-500 sm:text-sm"
  end
end
