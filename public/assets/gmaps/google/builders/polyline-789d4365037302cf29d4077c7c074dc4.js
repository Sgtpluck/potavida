(function(){var t={}.hasOwnProperty,i=function(i,n){function o(){this.constructor=i}for(var e in n)t.call(n,e)&&(i[e]=n[e]);return o.prototype=n.prototype,i.prototype=new o,i.__super__=n.prototype,i};this.Gmaps.Google.Builders.Polyline=function(t){function n(t,i){this.args=t,this.provider_options=null!=i?i:{},this.before_init(),this.serviceObject=this.create_polyline(),this.after_init()}return i(n,t),n.prototype.create_polyline=function(){return new(this.primitives().polyline)(this.polyline_options())},n.prototype.polyline_options=function(){var t;return t={path:this._build_path()},_.defaults(t,this.provider_options)},n.prototype._build_path=function(){return _.map(this.args,function(t){return function(i){return new(t.primitives().latLng)(i.lat,i.lng)}}(this))},n}(Gmaps.Objects.BaseBuilder)}).call(this);