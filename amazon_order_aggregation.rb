require 'csv'

class AmazonOrderAggregation
  class << self
    def aggregation
      last_month_price_diff = 0
      print "購入月,合計金額,前月比\n"
      parse_csv_data_by_month.sort.each do |parse_data_key, parse_data_value|
        print "#{parse_data_key},#{parse_data_value},#{price_diff(parse_data_value ,last_month_price_diff)}\n"
        last_month_price_diff = parse_data_value
      end
    end

    private

    def parse_csv_data_by_month
      parsed_datas = {}
      csv_files = Dir.glob('./csvs/*.csv')
      csv_files.each do |csv_file|
        CSV.read(csv_file, headers: true, liberal_parsing: true).each do |data|
          order_month = Date.strptime(data[0], '%Y/%m').strftime('%Y-%m')
          parsed_datas[order_month] = parsed_datas[order_month].to_i + data[4].to_i
        end
      end
      parsed_datas
    end

    def price_diff(this_month_price, last_month_price)
      return 0 if this_month_price.zero? || last_month_price.zero?

      price_diff = this_month_price - last_month_price
      if price_diff.positive?
        "+#{price_diff}"
      else
        price_diff
      end
    end
  end
end

AmazonOrderAggregation.aggregation
