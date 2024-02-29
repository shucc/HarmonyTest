export class IndexListItemBean {
  stockName: string
  stockPrice: number
  stockPriceRange: number

  constructor(stockName: string, stockPrice: number, stockPriceRange: number) {
    this.stockName = stockName
    this.stockPrice = stockPrice
    this.stockPriceRange = stockPriceRange
  }
}