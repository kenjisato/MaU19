# Equilibrium of Fisher Model

x <- seq(0, 5, by = 0.1)
y1 <- 1 / x
y2 <- 4 / x
y3 <- 9 / x

b <- -x + 4

quartz(type="pdf", file="Graphics/fisher-model-eqm.pdf", width=4, height=4)
par(mai = c(0.28, 0.35, 0.28, 0.28), 
    family="Palatino")

plot(NULL, axes = FALSE, xlab = "", ylab = "", xlim = c(-0.2, 5.1), ylim = c(-0.2, 5), lwd = 2)

polygon(c(x[b >= 0], 0), c(b[b >= 0], 0), col = "gray70")
lines(x[b >= 0], b[b >= 0], lwd = 2)

lines(x[y1 <= 5], y1[y1 <= 5], lwd = 2)
lines(x[y2 <= 5], y2[y2 <= 5], lwd = 2)
lines(x[y3 <= 5], y3[y3 <= 5], lwd = 2)

points(2, 2, pch = 16)
segments(2, 2, 2, 0, lty = 3, lwd = 2)
segments(0, 2, 2, 2, lty = 3, lwd = 2)
text(2, -0.2, expression(paste(C[1]^"*")))
text(-0.2, 2, expression(paste(C[2]^"*")))
text(2.1, 2.2, "E")

points(3, 1, pch = 16)
segments(3, 0, 3, 1, lty = 4, lwd = 2)
segments(0, 1, 3, 1, lty = 4, lwd = 2)
text(3, -0.2, expression(A[0]+Y[1]))
text(-0.2, 1, expression(Y[2]))
text(3.3, 1, "A")

arrows(0, 0, 5, 0, xpd = TRUE, lwd = 2, length = 0.1)
arrows(0, 0, 0, 5, xpd = TRUE, lwd = 2, length = 0.1)
text(5, -0.2, expression(C[1]))
text(-0.25, 5, expression(C[2]))


dev.off()
