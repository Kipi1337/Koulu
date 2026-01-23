async function getHouses() {
    let url = 'HT1.json'
    try {
        let res = await fetch(url)
        return await res.json()
    }
    catch (error) {
    console.log(error)
    }
}
async function renderHouses() {
    let houses = await getHouses();
    console.log(houses);
    let housediv = document.getElementById("houses");
    housediv.replaceChildren()

    const sizelimit = document.forms[0].choice[0].checked ? document.forms[0].choice[0].value : Math.max(...houses.map((house) => house.size))
    //     muuttuja                  ehto                            jos ehto on tosi                 muussa tapauksesssa
    const pricelimit = document.forms[0].choice[1].checked ? document.forms[0].choice[1].value : Math.max(...houses.map((house) => house.price))
    console.log(sizelimit)
    const filtered_houses = houses.filter((house) => house.size <= sizelimit && house.price <= pricelimit)
    console.log(filtered_houses)

    filtered_houses.forEach(house => {        

        housecontainer = document.createElement('div');
        housecontainer.className = 'houseContainer';

        let image = document.createElement('img');
        image.src = house.image;
        image.className = 'houseImage';

        let header = document.createElement('p');
        header.className = 'header';
        header.innerHTML = house.address;
        
        let size = document.createElement('p')
        size.innerHTML = house.size + " m2"

        let text = document.createElement('p')
        text.innerHTML = house.text

        let price = document.createElement('p')
        let numberstr = new Intl.NumberFormat('fi-FI').format(house.price);
        price.innerHTML = numberstr + "  €"
        
        housecontainer.appendChild(image);
        housecontainer.appendChild(header);
        housecontainer.appendChild(size);
        housecontainer.appendChild(text);
        housecontainer.appendChild(price);
		housediv.appendChild(housecontainer); 
    });    
}
renderHouses()