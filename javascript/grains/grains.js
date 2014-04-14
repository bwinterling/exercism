function Grains(){};

Grains.prototype.square = function(n) {
  return Math.pow(2, (n-1))
};

Grains.prototype.total = function() {
  return this.square(65)
};

module.exports = Grains;
