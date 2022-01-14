class Maney < ApplicationRecord
  belongs_to :user
  belongs_to :category

  scope :year_sort_list, -> {
    {
      "並び替え" => "",
      "2022年" => "2022",
      "2023年" => "2023",
    }
  }
  
  scope :month_sort_list, -> {
    {
      "並び替え" => "",
      "1月" => "01",
      "2月" => "02",
      "3月" => "03",
      "4月" => "04",
      "5月" => "05",
      "6月" => "06",
      "7月" => "07",
      "8月" => "08",
      "9月" => "09",
      "10月" => "10",
      "11月" => "11",
      "12月" => "12",
    }
  }
end
