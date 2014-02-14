function isLeapYear(year){
  var divisibleBy = function(divisor){
    return (year % divisor == 0);
  };
  return divisibleBy(400) || divisibleBy(4) && (divisibleBy(100) == false);
};

module.exports = isLeapYear;
