//
//  ProductCatalogViewController.swift
//  Ragnar
//
//  Created by Home on 9/24/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController, UISearchBarDelegate, SearchViewAnimateble {

    @IBOutlet var placesButton: UIButton!
    @IBOutlet var activityTypeButton: UIButton!
    @IBOutlet var activityButtonCollection: [UIButton]!
    @IBOutlet var placesButtonCollection: [UIButton]!
    @IBOutlet var tableView: UITableView!
    var activities = [Activity]()
    var filtered = [Activity]()

    var searchBar = UISearchBar()
    var searchBarButtonItem: UIBarButtonItem?
    var logoImageView   : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Can replace logoImageView for titleLabel of navbar
        let logoImage = UIImage(named: "whatToDo")!
        logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: logoImage.size.width, height: logoImage.size.height))
        logoImageView.image = logoImage
        navigationItem.titleView = logoImageView

        

        activityTypeButton.layer.masksToBounds = true
        activityTypeButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)
        placesButton.layer.masksToBounds = true
        placesButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.showsCancelButton = true

        searchBarButtonItem = navigationItem.rightBarButtonItem

        activityTypeButton.layer.cornerRadius = activityTypeButton.frame.height / 2
        activityButtonCollection.forEach { (button) in
            
            button.layer.cornerRadius = button.frame.height / 2
            button.isHidden = true
            button.alpha = 0
        }
        
        
        placesButton.layer.cornerRadius = activityTypeButton.frame.height / 2
        placesButtonCollection.forEach { (button) in
            
            button.layer.cornerRadius = button.frame.height / 2
            button.isHidden = true
            button.alpha = 0
        }
        activities = createProductArray()
        print("viewDidLoad filtered arr = \(filtered)")
        print("viewDidLoad product arr = \(activities)")
        filtered = filtered.isEmpty ? activities : filtered
        tableView.reloadData()
    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = searchText.isEmpty ? filtered : activities.filter { return $0.activityTitle.contains(searchText)}
        tableView.reloadData()
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        showSearchBar(searchBar: searchBar)
    }

    //MARK: UISearchBarDelegate
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideSearchBar()
    }
    func hideSearchBar() {
       navigationItem.setRightBarButton(searchBarButtonItem, animated: true)
       logoImageView.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
         self.navigationItem.titleView = self.logoImageView
         self.logoImageView.alpha = 1
         }, completion: { finished in
            self.filtered = self.activities
            self.tableView.reloadData()
       })
    }
    
    
    @IBAction func placePressed(_ sender: UIButton) {
        placesButtonCollection.forEach { (button) in
            UIView.animate(withDuration: 0.7) {
                button.isHidden = !button.isHidden
                button.alpha = button.alpha == 0 ? 1 : 0
            }

        }
    }
    @IBAction func placeSelectionPressed(_ sender: UIButton) {

        switch sender.titleLabel?.text {
            case "Restaurants":
                filtered = activities.filter({return $0.activityName == "Restaurants"})
                placesButtonCollection.forEach { (button) in
                    UIView.animate(withDuration: 0.7) {
                        button.isHidden = !button.isHidden
                        button.alpha = button.alpha == 0 ? 1 : 0
                    }
                }
            case "Hikes":
                filtered = activities.filter({return $0.activityName == "Hikes"})
                placesButtonCollection.forEach { (button) in
                    UIView.animate(withDuration: 0.7) {
                        button.isHidden = !button.isHidden
                        button.alpha = button.alpha == 0 ? 1 : 0
                    }
                }
            case "Neighborhoods":
                filtered = activities.filter({return $0.activityName == "Neighborhoods"})
                placesButtonCollection.forEach { (button) in
                    UIView.animate(withDuration: 0.7) {
                        button.isHidden = !button.isHidden
                        button.alpha = button.alpha == 0 ? 1 : 0
                    }
                }
            case "Grocery":
            filtered = activities.filter({return $0.activityName == "Grocery"})
            placesButtonCollection.forEach { (button) in
                UIView.animate(withDuration: 0.7) {
                    button.isHidden = !button.isHidden
                    button.alpha = button.alpha == 0 ? 1 : 0
                }
            }
            case "Atractions":
            filtered = activities.filter({return $0.activityName == "Atractions"})
            placesButtonCollection.forEach { (button) in
                UIView.animate(withDuration: 0.7) {
                    button.isHidden = !button.isHidden
                    button.alpha = button.alpha == 0 ? 1 : 0
                }
            }
            default:
                self.filtered = self.activities
            }
        tableView.reloadData()
    }
    
    
    @IBAction func activityTypePressed(_ sender: UIButton) {
        //self.selectBrandButton.setTitle("Activity Type", for: .normal)
        activityButtonCollection.forEach { (button) in
            UIView.animate(withDuration: 0.7) {
                button.isHidden = !button.isHidden
                button.alpha = button.alpha == 0 ? 1 : 0
                
            }
            tableView.reloadData()
        }
         
    }
    
    
    @IBAction func activityTypeSelectionPressed(_ sender: UIButton) {
       // self.selectBrandButton.setTitle(sender.titleLabel?.text, for: .normal)
        switch sender.titleLabel?.text {
        case "Food Scene":
            filtered = activities.filter({return $0.choice == "Food Scene"})
            activityButtonCollection.forEach { (button) in
                UIView.animate(withDuration: 0.7) {
                    button.isHidden = !button.isHidden
                    button.alpha = button.alpha == 0 ? 1 : 0
                    
                }
            }
        case "Sightseeing":
            filtered = activities.filter({return $0.choice == "Sightseeing"})
            activityButtonCollection.forEach { (button) in
                UIView.animate(withDuration: 0.7) {
                    button.isHidden = !button.isHidden
                    button.alpha = button.alpha == 0 ? 1 : 0
                }
            }
        case "Hikes&Beaches":
            filtered = activities.filter({return $0.choice == "Hikes&Beaches"})
            activityButtonCollection.forEach { (button) in
                UIView.animate(withDuration: 0.7) {
                    button.isHidden = !button.isHidden
                    button.alpha = button.alpha == 0 ? 1 : 0
                }
            }
        case "Shopping":
            filtered = activities.filter({return $0.choice == "Shopping"})
            activityButtonCollection.forEach { (button) in
                UIView.animate(withDuration: 0.7) {
                    button.isHidden = !button.isHidden
                    button.alpha = button.alpha == 0 ? 1 : 0
                }
            }
        default:
            self.filtered = self.activities
        }
        tableView.reloadData()
    }

    
    func createProductArray() -> [Activity] {
        
        var productArr = [Activity]()
        let goldenGateBridge = Activity(productImage: UIImage(named: "ggBridge")!, productTitle: "Golden Gate Bridge", brandName: "Sightseeing", productTypeName: "Atractions", tag: 0, information: """
The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.\n
Address: Golden Gate Bridge, San Francisco, CA
Total length: 8,981′
Construction started: January 5, 1933
Height: 746′
Location: San Francisco, Marin County
""", locationTitle: "Golden Gate Bridge", latitude: 37.820140458340404,  longtitude: -122.47830338202222)
        let palaceOffineArts = Activity(productImage: UIImage(named: "palaceOfFine")!, productTitle: "Palace Of Fine Arts", brandName: "Sightseeing", productTypeName: "Atractions", tag: 1, information: """
The Palace of Fine Arts in the Marina District of San Francisco, California is a monumental structure originally constructed for the 1915 Panama-Pacific Exposition in order to exhibit works of art. Completely rebuilt from 1964 to 1974, it is one of only a few surviving structures from the Exposition.\n
Address: 3601 Lyon St, San Francisco, CA 94123
Opened: 1915
Hours: Open ⋅ Closes 5PM
Architectural style: Beaux-Arts architecture
Architect: Bernard Maybeck
""", locationTitle: "Palace Of Fine Arts", latitude: 37.802210232489465, longtitude:  -122.44857331578508)
        let fishermansWharf = Activity(productImage: UIImage(named: "fisherman")!, productTitle: "Fisherman's Wharf", brandName: "Sightseeing", productTypeName: "Atractions", tag: 2, information: """
Fisherman’s Wharf, on the northern waterfront, is one of the city's busiest tourist areas. Souvenir shops and stalls selling crab and clam chowder in sourdough bread bowls appear at every turn, as do postcard views of the bay, Golden Gate and Alcatraz. There’s also a colony of sea lions to see and historic ships to tour. At Ghirardelli Square, boutiques and eateries reside in the famed former chocolate factory.\n
Restaurants: Fisherman's Wharf, Boudin Bakery Cafe
""", locationTitle: "Fisherman’s Wharf", latitude: 37.80808335770074, longtitude: -122.41750783853198)
        let ggPark = Activity(productImage: UIImage(named: "ggPark")!, productTitle: "Golden Gate Park", brandName: "Sightseeing", productTypeName: "Atractions", tag: 3, information: """
Golden Gate Park, located in San Francisco, California, United States, is a large urban park consisting of 1,017 acres of public grounds. It is administered by the San Francisco Recreation & Parks Department, which began in 1871 to oversee the development of Golden Gate Park.\n
Address: San Francisco, CAArea: 1.583 mi²
Hours:Open 24 hours
Visitors: 24 million
Designers: John McLaren, Calvert Vaux, William Hammond Hall
""", locationTitle: "Golden Gate Park", latitude: 37.7695819175691, longtitude: -122.48617088695069)
        let precidio = Activity(productImage: UIImage(named: "precidio")!, productTitle: "Presidio", brandName: "Sightseeing", productTypeName: "Atractions", tag: 4, information: "Presidio Park enables you to walk in the footsteps of California’s early European settlers. The popular attraction is the location where Gaspar de Portola and Junipero Serra constructed the San Diego Presidio and the Mission San Diego de Alcala in 1769. This fort and church, as well as the community that flourished around these sites, encompassed the first European settlement in the area now known as California. While the mission would later move further inland, the fort would serve as the capital of Baja California during the area’s rule by Mexico. Situated on a hill overlooking Old Town San Diego, the park features 40 acres of green open space, picnic areas, and memorials along with marvelous views of the surrounding landscape, including the San Diego River Valley and the Pacific Ocean. Although none of the original structures remain, the park was designated a National Historic Landmark in 1960.", locationTitle: "Presidio", latitude: 37.800747909371005, longtitude: -122.4678176718492)
        let napa = Activity(productImage: UIImage(named: "napa")!, productTitle: "Napa Valley", brandName: "Sightseeing", productTypeName: "Atractions", tag: 5, information: """
Napa County is north of San Francisco, in California. It's known for hundreds of hillside vineyards in the Napa Valley wine region. In the city of Napa, Oxbow Public Market features regional gourmet food. The Napa Valley Wine Train is a vintage locomotive and traveling restaurant running through the valley. Northwest of Napa is Yountville, a town known for high-end restaurants and sparkling wine. \n
Population: 137,744 (2019)
""", locationTitle: "Napa County", latitude: 38.30426421209267, longtitude: -122.28378083285143)
        let oracle = Activity(productImage: UIImage(named: "oracle")!, productTitle: "Oracle Chase Center", brandName: "Sightseeing", productTypeName: "Atractions", tag: 6, information: """
Oracle Park is a baseball park located in the South Beach neighborhood of San Francisco, California. Since 2000, it has served as the home of the San Francisco Giants, the city's Major League Baseball franchise. \n
Address: 24 Willie Mays Plaza, San Francisco, CA 94107
Capacity: 41,915
Opened: April 11, 2000
Team: San Francisco Giants
Owner: China Basin Ballpark
""", locationTitle: "Oracle Arena", latitude: 37.76799328899262,longtitude:  -122.38749995996311)
        let billy = Activity(productImage: UIImage(named: "billy")!, productTitle: "Billy Goat Hill", brandName: "Hikes&Beaches", productTypeName: "Hikes", tag: 7, information: """
This modest neighborhood green space offers a small trail network & wildlife viewing opportunities. \n
Address: 2442 Castro St, San Francisco, CA 94131
Hours:
Open ⋅ Closes 10PM
Phone: (415) 831-6331
Hours or services may differ
""", locationTitle: "Billy Goat Hill", latitude:37.7413631480055, longtitude: -122.43318544647005)
        let tweenPeaks = Activity(productImage: UIImage(named: "twin")!, productTitle: "Twin Peaks", brandName: "Hikes&Beaches", productTypeName: "Hikes", tag: 8, information: """
Twin Peaks, named for a pair of 922-foot-high summits, is a remote residential neighborhood with modern homes densely packed on steep lots along winding streets. A grassy 64-acre hilltop park is a popular attraction, with its hiking trails leading up to wind-swept peaks and 360-degree views of the Bay Area. The triple-pronged Sutro Tower antenna that soars over the neighborhood is a fixture in the skyline. \n
Address: 501 Twin Peaks Blvd, San Francisco, CA 94114
Elevation: 922′
Area: 34 acres
Hours:
Open ⋅ Closes 12AM
""", locationTitle: "Twin Peaks", latitude: 37.754370496537376,longtitude:  -122.44875127986961)
        let precidioL = Activity(productImage: UIImage(named: "precidio")!, productTitle: "Lovers'Lane", brandName: "Hikes&Beaches", productTypeName: "Hikes", tag: 9, information: """
Address: Lover's Ln, San Francisco, CA 94129
Hours:
Open 24 hours
Phone: (415) 561-4323
""", locationTitle: "Lovers' Lane", latitude: 37.795616828621654, longtitude: -122.45176020413928)
        let coronaHeight = Activity(productImage: UIImage(named: "corona")!, productTitle: "Corona Height", brandName: "Hikes&Beaches", productTypeName: "Hikes", tag: 10, information: """
Corona Heights Park is a park in the Castro and Corona Heights neighborhoods of San Francisco, California, United States. It is situated immediately to the south of Buena Vista Park. Corona Heights is bounded in part by Flint Street on the east, Roosevelt Way to the north, and 16th Street to the south. \n
Address: Roosevelt Way &, Museum Way, San Francisco, CA 94114
Departments: Lower States Street Park Basketball Court
Area: 15 acres
Hours:
Open ⋅ Closes 12AM
Phone: (415) 831-2700
""", locationTitle: "Corona Heights", latitude: 37.76236469000203,longtitude: -122.44390367339409)
        let fort = Activity(productImage: UIImage(named: "fort")!, productTitle: "Fort Funston", brandName: "Hikes&Beaches", productTypeName: "Hikes", tag: 11, information: """
Fort Funston is a former harbor defense installation located in the southwestern corner of San Francisco. Formerly known as the Lake Merced Military Reservation, the fort is now a protected area within the Golden Gate National Recreation Area. \n
Address: Fort Funston Rd, San Francisco, CA 94132
Hours:
Open ⋅ Closes 9PM
Phone: (415) 561-4700
Function: Fortification
Built: 1900
""", locationTitle: "Fort Funson", latitude: 37.71955206633872,longtitude: -122.50282665996446)
        let chinatown = Activity(productImage: UIImage(named: "chinatown")!, productTitle: "Chinatown", brandName: "Food Scene", productTypeName: "Neighborhoods", tag: 12, information: """
This is one of the oldest and most established Chinatowns in the U.S. Beyond iconic Dragon’s Gate, a bustling maze of streets and alleys brims with dim sum joints and other traditional eateries. Also found are herbalists, bakeries, souvenir shops, and dark cocktail lounges and karaoke bars. There are ornate temples, including the landmark Tien How, as well as the Chinese Historical Society of America Museum. \n
Restaurants: Z & Y Restaurant, Mister Jiu's
""", locationTitle: "China Town", latitude: 37.79413733734106,longtitude: -122.40747488162124)
        let downtown = Activity(productImage: UIImage(named: "down")!, productTitle: "Downtown", brandName: "Neighborhoods", productTypeName: "Atractions", tag: 13, information: """
The Financial District is the city’s business center. Among the skyscrapers that dominate the skyline is the striking, spire-topped Transamerica Pyramid building. There is a wealth of happy-hour hot spots and elegant date-night destinations, including the classic Tadich Grill, the city’s oldest restaurant. The Jackson Square Historic District features remnants of the Barbary Coast, a 19th-century red-light district. \n
Restaurants: 750 Restaurant & Bar, Wayfare Tavern, Tadich Grill
""", locationTitle: "Downtown", latitude:37.77849764465531, longtitude: -122.4166084139866)
        let northBeach = Activity(productImage: UIImage(named: "north")!, productTitle: "North Beach", brandName: "Hikes&Beaches", productTypeName: "Hikes", tag: 14, information: """
North Beach, a buzzy neighborhood steeped in Italian heritage, draws locals and tourists to its checked-tablecloth trattorias, coffee shops and retro-flavored bars. The spirit of the Beat Generation can be felt at the storied City Lights bookstore and the memorabilia-filled Vesuvio Cafe bar. In Telegraph Hill the Filbert Steps offer a scenic hike to the iconic Coit Tower, with WPA-era murals and panoramic views.\n
Elevation: 16.4′
Restaurants: North Beach Pizza, North Beach Restaurant
""", locationTitle: "North Beach", latitude: 37.80545778813592, longtitude: -122.40866845375277)
        let castro = Activity(productImage: UIImage(named: "castro")!, productTitle: "Castro", brandName: "Sightseeing", productTypeName: "Neighborhoods", tag: 12, information: """
The Castro District, in Eureka Valley, is synonymous with gay culture. Revelers often spill onto the sidewalks at numerous bars, like Twin Peaks Tavern, whose floor-to-ceiling windows were revolutionary when it opened in 1972. The lavish Castro Theatre and the GLBT Historic Museum are also found here, as are homey restaurants and adult shops. On Market Street, 19th-century F-line streetcars head to Fisherman’s Wharf. \n
Named for: José Castro
Restaurants: Lookout, Hi Tops, Starbelly, Kitchen Story
""", locationTitle: "Castro", latitude: 37.76310118084691, longtitude: -122.43427935998825)
        let pizza = Activity(productImage: UIImage(named: "goldenBoy")!, productTitle: "Pizza", brandName: "Food Scene", productTypeName: "Restaurants", tag: 15, information: """
Tony’s Pizza Napoletana
Tony's (as well as sister spot Capo's and several Slice Houses around the Bay) is commendable not only for its quality, but for its breadth. Though he's taken home umpteen Neapolitan pie-making prizes, Tony Gemignani is no purist: he's equally interested in Sicilian, Detroit-style, grandma-inspired, and coal-fired pies, and in wild toppings like the Honey Pie. The man is a pizza polymath, and his combinations are delicious. \n
A16
Way back in the pizza dark ages of 2004, A16 was one of the first places to serve true Neapolitan pies, gorgeous wood-fired char and all. They're still churning them out well over a decade later, often pairing the pies with A16’s on-point Italian wine selection.\n
Golden Boy Pizza
When it comes to hitting the spot, this pizzeria does it right. By the sheet or the slice, these Sicilian pies aren’t available as late as they used to be — the pandemic has shortened its business hours to 12-8 p.m. daily — but are delicious any time of day.\n
Tommaso's Ristorante Italiano
Any pizza restaurant frequented the filmmaker behind The Godfather is probably the real deal, and so it is with North Beach icon Tommaso’s. The more than 80-year-old restaurant was an influence on frequent diners like Francis Ford Coppola and others like Alice Waters and Wolfgang Puck, who supposedly built their own pizza ovens based on the the brick setup at Tommaso’s. While this crust might be a bit thick and doughy for some purists, it’s still an SF pizza must through and through.
""", locationTitle: "Golden Boys Pizza", latitude: 37.79988325151082,longtitude: -122.40804878694989)
        let sushi = Activity(productImage: UIImage(named: "amaniSushi")!, productTitle: "Sushi&Ramen", brandName: "Food Scene", productTypeName: "Restaurants", tag: 16, information: """
Daigo Sushi
Perhaps the most reliable sushi spot in the outer avenues, Daigo is a small, relatively low-key spot that’s known for its expertly prepared — and reasonably priced — nigiri. Call-in orders are preferred, but delivery is also available through all of the major third-party apps.\n
Ebisu Restaurant
The family-owned Sunset District standby is open Monday through Saturday, 11 a.m.–6 p.m., and is offering contactless pickup on an extensive takeout menu that includes a range of both sushi and non-sushi bowls. Order online, or get delivery via Uber Eats.\n
Kaisen Don
You can get big trays of rolls at this relative newcomer on Ocean Avenue, but the restaurant’s main point of distinction is its wide selection of chirashi bowls — various assortments of sliced fish served over rice, in the perfect portion for the solo at-home sushi eater. Call in or order online for takeout, or get delivery via the third-party apps.
""", locationTitle: "Daigo Sushi", latitude: 37.782245930970255, longtitude: -122.48577507160874)
        let thai = Activity(productImage: UIImage(named: "thai")!, productTitle: "Thai", brandName: "Food Scene", productTypeName: "Restaurants", tag: 17, information: """
Kin Khao
The ambiance is colorful and informal at this Michelin-starred Thai restaurant, from the decor to the bold curries. Kin Khao—which translates to “eat rice”—is the passion project of chef Pim Techamuanvivit, who was born and raised in Bangkok. (Her stated mission: “To liberate her beloved Thai cuisine from the tyranny of peanut sauce.”) All Techamuanvivit’s produce, mushrooms, meat, and seafood is sourced from local Northern California purveyors, from Half Moon Bay to Napa. The menu is separated into bites, meats, seafood, greens, and curries. The dishes are shareable and generously spiced, from the “Pretty Hot Wings” glazed with fish sauce, garlic marinade, tamarind, and Sriracha to the dry-fried Duroc pork ribs in a turmeric curry paste. Don’t miss Kin Khao’s modern spin on curries, like the rabbit green curry or the mackerel gaeng som sour curry. \n
Marnee Thai
Chef Chai Siriyarn opened the first Marnee Thai in 1986, well before Thai food became the takeout staple it is today. Siriyam grew up in Bangkok and learned how to cook from his mother; her influence is evident in the traditional flavors and bold spices of his dishes. Today, Siryam’s two restaurants—one in the Inner Sunset, the other in the Outer Sunset—specialize in aromatic, tongue-tingling dishes from Central Thailand. Specialties include the kao soi chicken and mussamun chicken curry.\n
Farmhouse Kitchen
This inviting Mission restaurant has a festive vibe, from the vibrant decor—brightly-colored accents, glinting penny tiles, hanging plants—to the upbeat soundtrack. Even the food is vivid: The popular fried chicken is served alongside blue rice (colored by the blue pea flower) and yellow potato curry. Co-owners Ling Chatterjee and husband Kasem “Pop” Saengsawang are the same duo behind Kitchen Story in the Castro and Blackwood in the Marina. Of the three, this spot serves the most authentic—and wholly Thai—fare. The pair focuses on high-quality ingredients, from Mary’s organic chicken to cage-free eggs and locally-sourced produce. The beef short rib, braised until it falls off the bone and slathered in Panang curry, is a stand-out.
""", locationTitle: "Marni Thai", latitude: 37.76528734548394, longtitude: -122.46661167345695)
        
        let turkish = Activity(productImage: UIImage(named: "turkish")!, productTitle: "Turkish", brandName: "Food Scene", productTypeName: "Restaurants", tag: 17, information: """
A La Turca
This Tenderloin spot is perhaps the best known Turkish restaurant in the city, and for good reason. The menu is fresh and full of authentic dishes that are often made by hand, including pide, the popular Turkish pizza equivalent. Their lentil soup, served with homemade bread, is a menu standout.\n
Tuba
This Turkish eatery makes you feel like family from the moment you sit down. You can’t go wrong with anything from their menu (especially if you like lamb,) but if you ask nicely the off-menu manti, or Turkish dumplings in a yogurt sauce, are some of the best you can get outside of Turkey.
""", locationTitle: "A La Turca", latitude: 37.78630505054391, longtitude: -122.41763421763332)
        let trader = Activity(productImage: UIImage(named: "trader")!, productTitle: "Trader's Joe", brandName: "Shopping", productTypeName: "Grocery", tag: 18, information: """
Trader Joe's is an American chain of grocery stores headquartered in Monrovia, California. By 2015, it was a competitor in "fresh format" grocery stores in the United States. By November 2019, Trader Joe's had over 503 stores nationwide in 42 states and Washington, D.C \n
Location: Closest location Stonestown and Daily City
""", locationTitle: "Trader's Joe", latitude: 37.72681709657617, longtitude: -122.47631170229351)
        let wholeFood = Activity(productImage: UIImage(named: "wholeFoods")!, productTitle: "Whole Foods", brandName: "Shopping", productTypeName: "Grocery", tag: 19, information: """
Whole Foods Market, Inc. is an American multinational supermarket chain headquartered in Austin, Texas, which sells products free from hydrogenated fats and artificial colors, flavors, and preservatives. A USDA Certified Organic grocer in the United States, the chain is popularly known for its organic selections. \n
Customer service: 1 (844) 936-8255
Parent organization: Amazon.com
Location: Ocean Ave
""", locationTitle: "WholeFoods", latitude: 37.72396800310533, longtitude: -122.45458498879964)
        let safeway = Activity(productImage: UIImage(named: "safeway")!, productTitle: "Safeway", brandName: "Shopping", productTypeName: "Grocery", tag: 20, information: """
Safeway is an American supermarket chain founded by Marion Barton Skaggs in April 1915 in American Falls, Idaho. \n
Customer service: 1 (877) 258-2799
Parent organization: Albertsons (2015–)
Location: Mission St. and Daily City
""",locationTitle: "Safeway", latitude: 37.720301544926, longtitude: -122.43868488758154)
        
           //refactor in a function
        productArr.append(goldenGateBridge)
        productArr.append(palaceOffineArts)
        productArr.append(fishermansWharf)
        productArr.append(ggPark)
        productArr.append(precidio)
        productArr.append(napa)
        productArr.append(oracle)
        productArr.append(billy)
        productArr.append(tweenPeaks)
        productArr.append(precidioL)
        productArr.append(coronaHeight)
        productArr.append(fort)
        productArr.append(chinatown)
        productArr.append(downtown)
        productArr.append(northBeach)
        productArr.append(castro)
        productArr.append(pizza)
        productArr.append(sushi)
        productArr.append(thai)
        productArr.append(turkish)
        productArr.append(safeway)
        productArr.append(wholeFood)
        productArr.append(trader)

        
        print("\(productArr)")
        return productArr
        }

    @objc func viewProductButtonTapped(_ sender: UIButton) {
        print("\(sender.tag)")
        let filteredProduct = filtered[sender.tag]
        let vc = storyboard?.instantiateViewController(identifier: "pdVC") as? ActivityDetailViewController
         vc?.image =  filteredProduct.activityImage
         vc?.activityTitleLbl = filteredProduct.activityTitle
         vc?.choiceNameLbl = filteredProduct.choice
         vc?.activityTypeLbl = filteredProduct.activityName
        vc?.informationText = filteredProduct.information
        vc?.locationTitle = filteredProduct.locationTitle
        vc?.locationLatitude = filteredProduct.latitude
        vc?.locationLongtitude = filteredProduct.longtitude
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension ActivityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filteredProduct = filtered[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCatalogCell") as! ActivityCatalogCell
        cell.viewActivityButton.tag = indexPath.row
        cell.viewActivityButton.addTarget(self, action: #selector(viewProductButtonTapped), for: .touchUpInside)
        cell.setActivityCell(product: filteredProduct)
        cell.selectionStyle = .none

        return cell
    }
}

protocol SearchViewAnimateble : class{ }

extension SearchViewAnimateble where Self: UIViewController {

func showSearchBar(searchBar : UISearchBar) {
    searchBar.alpha = 0
    navigationItem.titleView = searchBar
    navigationItem.setRightBarButton(nil, animated: true)

    UIView.animate(withDuration: 0.8, animations: {
        searchBar.alpha = 1
    }, completion: { finished in
        searchBar.becomeFirstResponder()
    })
}


}


