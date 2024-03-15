export class IndexListItemBean {
  stockName: string
  stockPrice: string
  stockPriceRange: string

  constructor(stockName: string, stockPrice: string, stockPriceRange: string) {
    this.stockName = stockName
    this.stockPrice = stockPrice
    this.stockPriceRange = stockPriceRange
  }
}