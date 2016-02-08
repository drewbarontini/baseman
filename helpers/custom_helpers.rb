# *************************************
#
#   Custom Helpers
#
# *************************************

module CustomHelpers

  # Sets the page title
  #
  # == Parameters
  #
  # @param separator [String] the delimiter for separating words
  #
  # == Usage
  #
  #   page_title
  #
  def page_title(separator = '-')
    if current_page.data.title
      "#{ current_page.data.title } #{ separator } #{ data.config.title }"
    else
      data.config.title
    end
  end

  # Put your custom helpers here...

end
