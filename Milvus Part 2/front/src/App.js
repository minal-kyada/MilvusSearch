import React, { useState } from 'react';

const App = () => {
  const [inputText, setInputText] = useState('');
  const [Expression,setExpression]=useState('');
  const [outputText, setOutputText] = useState([]);
  const REACT_APP_SERVER_DOMAIN="http://localhost:80"
  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch(`${REACT_APP_SERVER_DOMAIN}/query`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ inputText,Expression }),
      });

      const data = await response.json();
      // console.log(len(data));
      setOutputText(data);
    } catch (error) {
      console.error('Error sending POST request:', error);
    }
  };

  return (
    <div className='container items-center'>
      <h1>Milvus Querying</h1>
      <form onSubmit={handleSubmit}>
       <label htmlFor="inputText">Query String</label>
        <textarea
          id="inputText"
          name="inputText"
          rows="5"
          cols="40"
          value={inputText}
          onChange={(e) => setInputText(e.target.value)}
          required
        ></textarea>
        <br></br>
        <label htmlFor="Expression">Expression .</label>
         <textarea
          id="Expression"
          name="Expression"
          rows="5"
          cols="40"
          value={Expression}
          onChange={(e) => setExpression(e.target.value)}
          required
        ></textarea>
        {/* 'rows' and 'cols' attributes control the visible size of the textarea */}
        <br />
        <button type="submit">Submit</button>
      </form>

      <div>
        <h2>Output:</h2>
        <ul>
        {outputText.map((obj) => (
          <li>
            Rank: {obj.Rank}<br/>
            Business_name:{obj.Business_name}<br/>
            Review:{obj.Review}<br/>
            Community:{obj.Community}<br/>
            Rating:{obj.Rating}<br/>
            ReviewDate:{obj.Date}<br/>
            <br/>
          </li>
          
        ))}
      </ul>
      </div>
    </div>
  );
};

export default App;
