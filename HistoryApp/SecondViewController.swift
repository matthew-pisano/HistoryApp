//
//  SecondViewController.swift
//  HistoryApp
//
//  Created by Matthew Pisano on 4/19/20.
//  Copyright © 2020 Matthew Pisano. All rights reserved.
//

import UIKit
//Class mainlt shows the datails of the tapped region from the Map tab
class SecondViewController: UIViewController {
    //Label that displays the details of the current tapped region
    @IBOutlet weak var histOut: UILabel!
    //called when the view first loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //called when the tab is shown and updates histOut to the appropriate description
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated);
        print("esdsddfg");
        historyFunc(lat: FirstViewController.lat, long: FirstViewController.long)
        
    }
    //Set of strings that stores the description of each notable region
    let berlin: String = "The city of Berlin has extensive history behind it.  Originally the capital of the Electorate of Brandenbrug in the Holy Roman Empire, the city serves as a German cultural hub for centuries, seeing the rise and fall of Prissia, the North German Confederation and subsequent German Governments.  Today it serves as Germany's capital and a major financial center in Europe";//12|53, 15|52
    let paris: String = "The origins of Paris date back to the Roman controlled province of Gaul, where it began rapid growth.  Sat in the sdventagous regoin of France, and protected by many nautral land barriers such as mountains or rivers, Paris has been the heart of many French governments throughout the centuries, only being succesfully catpured twice by the Germans in the past two centuries.  today, it serves as a cultural hub for much of werstern Europe";//1.3|49, 3.3|48
    let prague: String = "One interesting fact about Prague is the role it played in the begining of the Thirty Years War in Europe.  For over a century tensions had been building inside the Holy Roman Empire between its Catholic and Protestant groups.  Conflict was inevitable between these groups.  It all came to a head when several reformers defenistrated (thres out of a window) a Holy Roman messenger, sparking a war that wiped out nearly a third of the German population at the time.";//13.2|50.8, 15.8, 50.2
    let constantinople: String = "This city, originally called Byzantium, housed the capital of the Eastern Roman empire for over a millenium.  It served as the symbolic ideal city of Europe for many centuries.  Notably, it was one of the hardest cities hit by the first wave of the black plague, known as the plague of Justinian after Justinian I, the Byzantine Emperor at the time.  It fell to the Ottoman turks in 1453, unfirtunatley, after one of the gates to its walls was reportedly left open, allowing the Turkish forces to rush in and storm its defenses.";//27.3|41.7, 30.3, 40.3
    let netherLands: String = "The Netherlands, a region in Northern Eueope with a relitively short, yet extremley impressive hirstory.  After its independence from spain in the late 1600s, the Dutch rapidly began work on a colonial empire.  Even though much of the colonial land in the Ameriacs was already claimed by other European powers, they managed to secure a frw trading outposts, most notably New Amsterdam (today New York City), as well as securing the spice trade in the East Indies (modern Malasia and Indonesia).  This lead to the creation of the East india company, the wealthiest coropration hirstoy with a net worth of 17 trillion dollars in todays money at its peak";//3.8, 53.1|7.7, 51.1
    let novgorod: String = "While it isnt much today, the small trading city was once home to one of Europes most influential republics.  From the13th to 15th centuries, the Republic of Novgorod was the center of Russian culture, resisting powers from the mongols to the crucader states of the baltic. Even after the republic was annexed by the Duchy of Moscow in the 1400s, it remained a powerful and influential city until its destruction by the hands of Ivan the Terrible of Russia";//29.9, 59.1|32.2, 58
    let hesse: String = "While this small region of Germany might not seem like much, during the days of the Holy Roman Empire, Hesse was one of its most influential princes.  With achivements ranging from the contrubution of mercenaries to the British during the American Revolution to its status as one of the lest surviving states of the dyidng HRE, the history of Hesse far punches above its size";//8.3, 50.3|10, 50.5
    let world: String = "The world: (Almost) every human lives here, containing (almost) all of human civilization and culture lives here";
    let europe: String = "Europe, the continent in which nearly all of western civilization stems from.  From its initial habitation by neanthretals to their extinction by the hands of humans.  Evolving through various invasions of Indo-Iranians, to caucasians, each people built upon the culture of the last.  Wittnesing the rise and fall of empires, philosophy and eventuall its peoples colonizing and spreadin their culture and influence throughout the world";//-14.3, 69.7|45.5, 36.2
    let africa: String = "Containing the birthplace of both early humans and early human culture, this continent is intregral to human history.  Seeing the rise of humans and their spread all over the planet.  From Ghana to Mali to eventually the kingdoms of Egypt, Africa has been at the forfront of human civilization and technology";//-18.1, 35.2|47.9, -35.2
    let asia: String = "Begining its history as the birthplace of human civilization as we know it.  Begining with the likes of Sumer and Babylon, and eventually moving out into India and China.  From the many dynasties of China to the fractured kingdoms of India to their eventual colonization by Europeans in the modern age.";//40.3, 71.4|133.4, 3.8
    let australia: String = "Please never go here";//113.1, -10.9|153.5, -40.3
    
    //Given the current coordinates from the Map tab, histOut is assigned the text from the appropriate string of details
    public func historyFunc(lat: Double, long: Double){
        print("Lat: "+String(lat)+", LOng: "+String(long));
        if(long < 15 && long > 12 && lat < 53 && lat > 52) {histOut.text = berlin;}
        else if(long < 3.3 && long > 1.3 && lat < 49 && lat > 48) {histOut.text = paris;}
        else if(long < 15.8 && long > 13.2 && lat < 50.8 && lat > 50.2) {histOut.text = prague;}
        else if(long < 30.3 && long > 27.3 && lat < 41.7 && lat > 40.3) {histOut.text = constantinople;}
        else if(long < 7.7 && long > 3.8 && lat < 53.1 && lat > 51.1) {histOut.text = netherLands;}
        else if(long < 32.2 && long > 29.9 && lat < 59.1 && lat > 58) {histOut.text = novgorod;}
        else if(long < 10 && long > 8.3 && lat < 50.5 && lat > 50.3) {histOut.text = hesse;}
        else if(long < 45.5 && long > -14.3 && lat < 69.7 && lat > 36.2) {histOut.text = europe;}
        else if(long < 47.9 && long > -18.1 && lat < 35.2 && lat > -35.2) {histOut.text = africa;}
        else if(long < 133.4 && long > 40.3 && lat < 71.4 && lat > 3.8) {histOut.text = asia;}
        else if(long < 153.5 && long > 113.1 && lat < -40.3 && lat > -10.9) {histOut.text = australia;}
        else {histOut.text = world;}
    }}

