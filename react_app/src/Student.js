import React from 'react';

function Student(props) {
  return (
    <div className="student-item">
      <span className="student-name">{props.name}</span>
      <span className="student-grade">Grade: {props.grade}</span>
    </div>
  );
}

export default Student;
