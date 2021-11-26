import React from 'react'
import PropTypes from "prop-types";
import _ from "lodash";

const ErrorMessage = props => {
  const data = _.get(props.errorMessage, "response.data", null);
  const message = _.get(props.errorMessage, "message", null);
  if (data) {
    const keys = Object.keys(data);
    return keys.map(key => {
      return (
        <div key={new Date()} className="position-fixed bottom-0 end-0 p-3 alert alert-danger z-eleven" role="alert" aria-live="assertive" aria-atomic="true">
          <div className="toast-body fw-bold text-danger">
            {data[key].map(message => message)}
          </div>
        </div>
      );
    });
  } else if (message) {
      return (
        <div className="position-fixed bottom-0 end-0 p-3 alert alert-danger z-eleven" role="alert" aria-live="assertive" aria-atomic="true">
          <div className="toast-body fw-bold text-danger">
            {message}
          </div>
        </div>
      )
  } else {
      return (
        <div className="position-fixed bottom-0 end-0 p-3 alert alert-danger z-eleven" role="alert" aria-live="assertive" aria-atomic="true">
          <div className="toast-body fw-bold text-danger">
            There was an error.
          </div>
        </div>
      )
  }
}

export default ErrorMessage;

ErrorMessage.propTypes = {
  errorMessage: PropTypes.object.isRequired
};
