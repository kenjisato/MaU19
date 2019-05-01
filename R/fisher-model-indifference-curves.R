# Indifference curves of Fisher Model

plot_many_graphs <- function(path, x, Ymat) {
  quartz(type="pdf", file=path, width=4, height=4)
  par(mai = c(0.28, 0.35, 0.28, 0.28), family="Palatino")
  
  plot(NULL, axes = FALSE, xlab = "", ylab = "", xlim = c(-0.2, 5.1), 
       ylim = c(-0.2, 5), lwd = 2)
  
  for (i in seq_along(U)) {
    lines(x[Ymat[, i] <= 5], Ymat[, i][Ymat[, i] <= 5], lwd = 2, col = "gray50")
  }
  
  arrows(0, 0, 5, 0, xpd = TRUE, lwd = 2, length = 0.1)
  arrows(0, 0, 0, 5, xpd = TRUE, lwd = 2, length = 0.1)
  text(5, -0.2, expression(C[1]))
  text(-0.25, 5, expression(C[2]))
  
  points(2, 2, pch = 16)
  arrows(2, 2, 4, 2, xpd = TRUE, lwd = 2, length = 0.1)
  arrows(2, 2, 2, 4, xpd = TRUE, lwd = 2, length = 0.1)
  arrows(2, 2, 3, 3, xpd = TRUE, lwd = 2, length = 0.1)
  
  dev.off()
  
}

# common data
x <- seq(0, 5, by = 0.01)
y <- function(x, beta, U) (exp(U) / x) ^ (1 / beta)

# beta = 0.95
beta1 <- 0.95
U <- seq(0.001, 4.0, by = 0.15)
Y1 <- matrix(0.0, length(x), length(U))
for (i in seq_along(U)){
  Y1[, i] <- y(x, beta1, U[i])
}
plot_many_graphs("Graphics/fisher-model-indifference-curves-1.pdf", x, Y1)

# beta = 0.4
beta2 <- 0.4
U <- seq(0.001, 3.0, by = 0.12)
Y2 <- matrix(0.0, length(x), length(U))
for (i in seq_along(U)){
  Y2[, i] <- y(x, beta2, U[i])
}
plot_many_graphs("Graphics/fisher-model-indifference-curves-2.pdf", x, Y2)