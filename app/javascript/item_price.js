const itemPrice = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxPrice  = document.getElementById("add-tax-price");
    const profit  = document.getElementById("profit");
    addTaxPrice.innerHTML = `${Math.floor(inputValue * 0.1).toLocaleString()}`;
    profit.innerHTML = `${Math.floor(inputValue * 0.9).toLocaleString()}`;
  });
}
window.addEventListener('load', itemPrice);