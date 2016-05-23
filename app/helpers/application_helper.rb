require 'digest/md5'

module ApplicationHelper
    def hexcolor(string)
      if string.present?
        "##{Digest::SHA1.hexdigest(string)[0..5]}"
      else
        "#fff"
      end
    end
end
