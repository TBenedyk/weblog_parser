# frozen_string_literal: true

module HashRefinements
  refine Hash do
    def count_values(unique = false)
      transform_values do |v|
        unique ? v.uniq.count : v.count
      end
    end

    def sort_by_value(order = :asc)
      case order
      when :asc
        sort_by { |_, v| v }
      when :desc
        sort_by { |_, v| -v }
      else
        raise ArgumentError('Method can only receive :asc or :desc')
      end
    end
  end
end
