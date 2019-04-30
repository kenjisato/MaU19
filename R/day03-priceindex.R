# 物価指数の比較

laspeyres <- function(ppast, pnow, xpast) {
  sum(pnow * xpast) / sum(ppast * xpast)
}

paasche <- function(ppast, pnow, xnow) {
  sum(pnow * xnow) / sum(ppast * xnow)
}

fisher <- function(ppast, pnow, xpast, xnow) {
  sqrt(laspeyres(ppast, pnow, xpast) * paasche(ppast, pnow, xnow))
}



ppast <- c(100000, 1000)
pnow <- c(120000, 1500)
xpast <- c(25, 1000)
xnow <- c(35, 800)


laspeyres(ppast, pnow, xpast)
paasche(ppast, pnow, xnow)
fisher(ppast, pnow, xpast, xnow)

