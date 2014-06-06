module HistoryControl
  def history_attrs
    @history_attrs ||= Set.new
  end

  def history_attr(attr)
    history_attrs << attr.to_s

    define_method attr do
      if self.has_attribute?(attr)
        self[attr]
      else
        history.last.try(attr)
      end
    end

    define_method "#{attr}=" do |new_val|
      if history.last
        if history.last.new_record?
          history.last.send("#{attr}=", new_val)
        else
          current_attrs = history.last.attributes.slice(*self.class.history_attrs)
          history.new(current_attrs.merge(attr => new_val))
        end
      else
        history.new(attr => new_val)
      end

      if self.has_attribute?(attr)
        self[attr] = new_val
      end
    end
  end
end