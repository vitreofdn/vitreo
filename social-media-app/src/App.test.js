import { render, screen } from "./helpers/test-utils";
import App from "./App";

test("renders Welcome to Vitreo text", () => {
  render(<App />);
  const linkElement = screen.getByText(/Welcome to Vitreo!/i);
  expect(linkElement).toBeInTheDocument();
});
