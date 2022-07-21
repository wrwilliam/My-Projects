import { useState, useEffect } from "react";
import "../Css/Form.css";
// import Form2 from './Form2';

function Form() {
  const initialValues = { username: "", email: "", password: "" };
  const [title, setTitle] = useState("");
  const [body, setBody] = useState("");
  const [author, setAuthor] = useState("");

  const [formValues, setFormValues] = useState(initialValues);
  const [formErrors, setFormErrors] = useState({});
  const [isSubmit, setIsSubmit] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormValues({ ...formValues, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    setFormErrors(validate(formValues));
    setIsSubmit(true);
    // const blog={title,body, author}
  };

  useEffect(() => {
    console.log(formErrors);
    if (Object.keys(formErrors).length === 0 && isSubmit) {
      console.log(formValues);
    }
  }, [formErrors]);
  const validate = (values) => {
    const errors = {};

    if (!values.username) {
      errors.username = "please input username!";
    }
    if (!values.email) {
      errors.email = "Email is required!";
      // } else if (!regex.test(values.email)) {
      //   errors.email = "This is not a valid email format!";
    }
    if (!values.password) {
      errors.password = "Password is required";
    } else if (values.password.length < 4) {
      errors.password = "Password must be more than 4 characters";
    } else if (values.password.length > 10) {
      errors.password = "Password cannot exceed more than 10 characters";
    }
    return errors;
  };

  return (
    <div className="container">
      {Object.keys(formErrors).length === 0 && isSubmit ? (
        <div className="ui message success">Signed in successfully</div>
      ) : (""

      )}

      <form onSubmit={handleSubmit}>
        <h1>Please Login</h1>
        <div className="ui divider"></div>
        <div className="ui form">
          <div className="field">
            <label for="username">Username</label>
            <input
              type="text"
              name="username"
              placeholder="Username"
              id="username"
              value={formValues.username}
              onChange={handleChange}
            />
          </div>
          <p>{formErrors.username}</p>
          <div className="field">
            <label for="email">Email</label>
            <input
              id="email"
              type="text"
              name="email"
              placeholder="Email"
              value={formValues.email}
              onChange={handleChange}
            />
          </div>
          <p>{formErrors.email}</p>
          <div className="field">
            <label for="password">Password</label>
            <input
              type="password"
              id="password"
              name="password"
              placeholder="Password"
              value={formValues.password}
              onChange={handleChange}
            />
          </div>
          <p>{formErrors.password}</p>




          <div>
            <button className="fluid ui button blue">Submit</button>
          </div>
          <p>{title} {author} </p>
        </div>
      </form>
    </div>
  );
}
export default Form;