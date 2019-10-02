class Book < ApplicationRecord


    def self.murah
        order(price: :desc)
    end

    def self.harga_menengah
        where('price > ?',600).where('price < ?',20000)
    end

    def self.dari_terbesar
        order(price: :desc)
    end

    def self.dari_terkecil
        order(price: :asc)
    end
end
