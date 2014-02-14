function Grains(){
  this.square = function(num){
    return Math.pow(2,(num - 1));
  };
  this.total = function(){
    return this.square(65);
  };
};

module.exports = Grains;
