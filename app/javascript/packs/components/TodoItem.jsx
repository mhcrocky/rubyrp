import React from 'react'
import PropTypes from 'prop-types'
import _ from "lodash";
import axios from "axios";
import setAxiosHeaders from "./AxiosHeaders";

class TodoItem extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      complete: this.props.todoItem.complete,
    }
    this.handleChange = this.handleChange.bind(this);
    this.updateTodoItem = this.updateTodoItem.bind(this);
    this.inputRef = React.createRef();
    this.completedRef = React.createRef();
    this.finishedRef = React.createRef();
    this.handleDestroy = this.handleDestroy.bind(this);
    this.path = `/api/v1/todo_items/${this.props.todoItem.id}`;
  }

  handleChange() {
    this.setState({
      complete: this.completedRef.current.checked
    });
    // console.log(this.finishedRef.current);
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0');
    var yyyy = today.getFullYear();
    today = mm + '.' + dd + '.' + yyyy;
    this.finishedRef.current.innerHTML = today;
    this.updateTodoItem();
  }
  updateTodoItem = _.debounce(() => {
    setAxiosHeaders();
    axios
      .put(this.path, {
        todo_item: {
          title: this.inputRef.current.value,
          complete: this.completedRef.current.checked
        }
      })
      .then(response => {
        this.props.clearErrors();
      })
      .catch(error => {
        this.props.handleErrors(error);
        console.log(error);
      });
      setTimeout(() => {
        Chartkick.eachChart( function(chart) {
          chart.updateData(chart.getDataSource());
          // console.log('Chart Updated');
        })
      }, 250);
  }, 1000);

  handleDestroy() {
    setAxiosHeaders();
    const confirmation = confirm("Are you sure you want to delete this item?");
    if (confirmation) {
      axios
        .delete(this.path)
        .then(response => {
          this.props.getTodoItems();
        })
        .catch(error => {
          console.log(error);
        });
    }
    setTimeout(() => {
      Chartkick.eachChart( function(chart) {
        chart.updateData(chart.getDataSource());
        // console.log('Chart Updated');
      })
    }, 250);
  }

  render() {
    const { todoItem } = this.props
    return (
      <tr className={`${ this.state.complete && this.props.hideCompletedTodoItems ? `d-none` : "" } ${this.state.complete ? "table-light" : ""}`} >
        <td>
          {todoItem.created}
        </td>
        <td>
          <span
            ref={this.finishedRef}
            className={`finish-date ${
              this.state.complete ? `text-dark` : `text-white`
            }`}
          >
            {todoItem.finished}
          </span>
        </td>
        <td>
          <input
            type="text"
            defaultValue={todoItem.title}
            disabled={this.state.complete}
            onChange={this.handleChange}
            ref={this.inputRef}
            className="form-control"
            id={`todoItem__title-${todoItem.id}`}
          />
        </td>
        <td className="text-right">
          <div className="form-check form-check-inline">
            <input
              type="boolean"
              defaultChecked={this.state.complete}
              type="checkbox"
              onChange={this.handleChange}
              ref={this.completedRef}
              className="form-check-input"
              id={`complete-${todoItem.id}`}
            />
            <label
              className="form-check-label"
              htmlFor={`complete-${todoItem.id}`}
            >
            </label>
          </div>
          <button onClick={this.handleDestroy} className="close"><i className="fas fa-trash text-dark"></i></button>
        </td>
      </tr>
    )
  }

}

export default TodoItem

TodoItem.propTypes = {
  todoItem: PropTypes.object.isRequired,
  getTodoItems: PropTypes.func.isRequired,
  hideCompletedTodoItems: PropTypes.bool.isRequired,
  clearErrors: PropTypes.func.isRequired
};
