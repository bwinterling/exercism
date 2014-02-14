var SpaceAge = function(age) {
  this.seconds = age;
  var myRoundTwo = function(number){
    return Math.round(number * 100) / 100;
  };
  var rawEarthYears = function(){
    return age / 31557600;
  };
  this.onEarth = function(){
    return myRoundTwo(rawEarthYears());
  };
  this.onMercury = function(){
    return myRoundTwo(rawEarthYears() / 0.2408467);
  };
  this.onVenus = function(){
    return myRoundTwo(rawEarthYears() / 0.61519726);
  };
  this.onMars = function(){
    return myRoundTwo(rawEarthYears() / 1.8808158);
  };
  this.onJupiter = function(){
    return myRoundTwo(rawEarthYears() / 11.862615);
  };
  this.onSaturn = function(){
    return myRoundTwo(rawEarthYears() / 29.447498);
  };
  this.onUranus = function(){
    return myRoundTwo(rawEarthYears() / 84.016846);
  };
  this.onNeptune = function(){
    return myRoundTwo(rawEarthYears() / 164.79132);
  };
};

module.exports = SpaceAge;
