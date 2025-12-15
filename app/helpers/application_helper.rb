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
end
