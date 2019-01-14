import React, { Component } from 'react';

export class PropertyDetailsContainer extends Component {

  render() {
  	if(this.props.data){
	    return (
	      <div class="selected-property">
	        <div class="information">
	          <h4> PROPERTY DETAILS </h4>
	          <h6> Address </h6>
	            {this.props.data.address.full_address}
	          <h6> Council </h6>
	            {this.props.data.lga.council}
	          <h6> PostCode </h6>
	            {this.props.data.address.postcode}
	        </div>
	      </div>
	    )
	}
	else{
		return null;
	}
  }
}

export default PropertyDetailsContainer;