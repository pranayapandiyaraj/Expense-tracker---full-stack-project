import React from 'react';
import Student from './Student';

function App() {
  const students = [
    { id: 1, name: "Pranav M", grade: "A+" },
    { id: 2, name: "Alice Smith", grade: "A" },
    { id: 3, name: "Bob Johnson", grade: "B+" },
    { id: 4, name: "Diana Prince", grade: "A-" }
  ];

  return (
    <div className="app-container">
      <h2>Student Directory (React Props Demo)</h2>
      <div className="student-list">
        {students.map((student) => (
          <Student key={student.id} name={student.name} grade={student.grade} />
        ))}
      </div>
    </div>
  );
}

export default App;
