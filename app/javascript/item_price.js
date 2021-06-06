window.addEventListener('load', function(){
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const taxPrice =  inputValue * 0.1;
    const saleProfit = inputValue - taxPrice;

    addTaxPrice.innerHTML = Math.round(taxPrice);
    profit.innerHTML = Math.round(saleProfit);
  });
})

