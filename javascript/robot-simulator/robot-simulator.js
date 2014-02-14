function Robot(){
  var notContains = function(a, obj) {
    for (var i = 0; i < a.length; i++) {
        if (a[i] === obj) { return false; }
    }
    return true;
  };
  var actions = {
    north : ['east', 'west', [0,1]],
    east : ['south', 'north', [1,0]],
    south : ['west', 'east', [0,-1]],
    west : ['north', 'south', [-1,0]],
    L : 'turnLeft',
    R : 'turnRight',
    A : 'advance'
  };

  this.coordinates = [0,0];
  this.at = function(x,y){
    this.coordinates[0] = x;
    this.coordinates[1] = y;
  };
  var validDirections = [ 'east', 'west', 'north', 'south' ];
  this.orient = function(direction){
    if(notContains(validDirections, direction)) throw "Invalid Robot Bearing";
    this.bearing = direction;
  };
  this.bearing = "";
  this.turnRight = function(){
    this.bearing = actions[this.bearing][0];
  };
  this.turnLeft = function(){
    this.bearing = actions[this.bearing][1];
  };
  this.advance = function(){
    this.coordinates[0] = this.coordinates[0] + actions[this.bearing][2][0];
    this.coordinates[1] = this.coordinates[1] + actions[this.bearing][2][1];
  };
  this.instructions = function(code){
    var commands = []
    for(var i=0;i<code.length;i++){
      commands.push(actions[code[i]]);
    };
    return commands;
  };
  this.place = function(location_settings){
    this.coordinates = [location_settings["x"],location_settings["y"]];
    this.bearing = location_settings["direction"];
  };

  this.evaluate = function(commands){
    this.instructions(commands).forEach(function(action){
      this[action]();
    }, this);
  };

};

module.exports = Robot;
