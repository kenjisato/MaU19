# Equilibrium of Fisher Model with borrowing constraint

x <- seq(0, 5, by = 0.1)
y1 <- 3 / x
y2 <- 4 / x

b <- -x + 4

quartz(type="pdf", file="Graphics/fisher-model-borrowing-constraint.pdf", width=4, height=4)
par(mai = c(0.28, 0.35, 0.28, 0.28), 
    family="Palatino")

plot(NULL, axes = FALSE, xlab = "", ylab = "", xlim = c(-0.2, 5.1), ylim = c(-0.2, 5), lwd = 2)

lines(x[y1 <= 5], y1[y1 <= 5], lwd = 2)
lines(x[y2 <= 5], y2[y2 <= 5], lwd = 2)

polygon(c(0, x[b >= 0 & x <= 1], 1), c(0, b[b >= 0 & x <= 1], 0), col = "gray90", lty = 0)
lines(x[b >= 0], b[b >= 0], lwd = 2)


points(2, 2, pch = 16)
segments(2, 2, 2, 0, lty = 3, lwd = 2)
segments(0, 2, 2, 2, lty = 3, lwd = 2)
text(2, -0.2, expression(paste(C[1]^"*")))
text(-0.2, 2, expression(paste(C[2]^"*")))
text(2.1, 2.2, "E")

points(1, 3, pch = 16)
segments(1, 0, 1, 3, lty = 4, lwd = 2)
segments(0, 3, 1, 3, lty = 4, lwd = 2)
text(1, -0.2, expression(Y[1]))
text(-0.2, 3, expression(Y[2]))
text(0.85, 2.8, "A")

arrows(0, 0, 5, 0, xpd = TRUE, lwd = 2, length = 0.1)
arrows(0, 0, 0, 5, xpd = TRUE, lwd = 2, length = 0.1)
text(5, -0.2, expression(C[1]))
text(-0.25, 5, expression(C[2]))


dev.off()
