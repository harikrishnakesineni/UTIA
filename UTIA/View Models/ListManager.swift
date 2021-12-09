//
//  ListManager.swift
//  test
//
//  Created by Hari krishna on 26/11/21.
//

import Foundation
import CoreData
import SwiftUI

class ListManager: ObservableObject {
    @Published var listOfContinents: [Continent]
    @Published var listOfCountries: [Country]
    @Published var donations: [Donate]
    
    let persistentContainer: NSPersistentContainer
    let persistentController = PersistenceController.shared
    let context: NSManagedObjectContext
    
    init() {
        self.listOfContinents = []
        self.listOfCountries = []
        self.donations = []
        persistentContainer = NSPersistentContainer(name: "Donations")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core data Store failed \(error.localizedDescription)")
            }
        }
        self.context = persistentContainer.viewContext
        let fetchSeedContinents: NSFetchRequest<Continent> = Continent.fetchRequest()
        let fetchSeedCountries: NSFetchRequest<Country> = Country.fetchRequest()
        
        do {
        let countryCount = try persistentContainer.viewContext.fetch(fetchSeedCountries).count
            if countryCount <= 0 {
                seedDataStore()
            }
        } catch let error {
            print("Countries count error \(error.localizedDescription)")
        }
        
       
    }
    
    func addDonations(donation: Donate) {
        
        donations.append(donation)
    }
    
//    func getListOfCountries(region: String) {
//
//    }
    func getListOfCountries(_ region: String) {
        let fetchContinents: NSFetchRequest<Continent> = Continent.fetchRequest()
        fetchContinents.predicate = NSPredicate(format: "continentName == %@", region)
        do {
            if let continent = try persistentContainer.viewContext.fetch(fetchContinents).first {
            let fetchRequest: NSFetchRequest<Country> = Country.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "continentId == %i", continent.continentId)
            self.listOfCountries =  try persistentContainer.viewContext.fetch(fetchRequest)
            }
        }
        catch let error {
            print("There is an error in getlistCountries \(error.localizedDescription)")
        }
    
    }
    
    func seedDataStore() {
        
        seedContinents()
        seedCountries()
        
        
    }
    
    func seedContinents() {
        let continents = [(continentId: 1, continentName: "Asia"),
                          (continentId: 2, continentName: "Africa"),
                          (continentId: 3, continentName: "Europe"),
                          (continentId: 4, continentName: "North America"),
                          (continentId: 5, continentName: "South America")
        ]
        
        for continent in continents {
            let newContinent = NSEntityDescription.insertNewObject(forEntityName: "Continent", into: context) as! Continent
            newContinent.continentId = Int16(continent.continentId)
            newContinent.continentName = continent.continentName
        }
        do {
            try context.save()
        }
        catch let error {
            print("There is an error in seed continents \(error.localizedDescription)")
        }
        
    }
    
    func seedCountries() {
        let countries = [(continentId: 1, countryId: 1, countryName: "Vietnam",
                          countryDescription: "description of veitnam", countryImage: "statistics"),
                         (continentId: 1, countryId: 2, countryName: "India",
                          countryDescription: "description of india", countryImage: "statistics"),
                         (continentId: 1, countryId: 3, countryName: "China",
                          countryDescription: "description of china", countryImage: "statistics"),
                         (continentId: 1, countryId: 4, countryName: "Malaysia",
                          countryDescription: "description of malaysia", countryImage: "statistics"),
                         (continentId: 1, countryId: 5, countryName: "Lebanon",
                          countryDescription: "description of lebanon", countryImage: "statistics"),
                         
                         (continentId: 2, countryId: 6, countryName: "Nigeria",
                          countryDescription: "description of nigeria", countryImage: "statistics"),
                         (continentId: 2, countryId: 7, countryName: "Chad",
                          countryDescription: "description of chad", countryImage: "statistics"),
                         (continentId: 2, countryId: 8, countryName: "Ethopia",
                          countryDescription: "Ethiopia is a country with one of the largest poverty rates, yet is having the greatest poverty reduction, with the population dropping from the national poverty line from 39% in 2004 to 24% in 2015. Urban areas in development caused a massive impact in this reduction as there were many investments helped in the urban renewal initiative and the quick economic growth. Even rural regions have impacted the reduction, but it is recently slow, due to consumption growth declining slightly, and lower consumption growth causes lesser development, ultimately increasing the severity of poverty.\n\nCOVID-19 has surged economic downfalls in the country, caused by lower employment and income. During the first few weeks of the pandemic, employment plummeted, especially in urban areas where the employment rate dropped from 80% before COVID-19 to 65% in April 2020. Analytics shows that most of the population are affected socially, it gives a setback to the economy of the nation and overall undermines the progress of poverty reduction.", countryImage: "EthiopiaImage"),
                         (continentId: 2, countryId: 9, countryName: "Morocco",
                          countryDescription: "description of morocco", countryImage: "statistics"),
                         (continentId: 2, countryId: 10, countryName: "Kenya",
                          countryDescription: "description of kenya", countryImage: "statistics"),
                         
                         (continentId: 3, countryId: 11, countryName: "Ireland",
                          countryDescription: "description of Ireland", countryImage: "statistics"),
                         (continentId: 3, countryId: 12, countryName: "Greece",
                          countryDescription: "description of Greece", countryImage: "statistics"),
                         (continentId: 3, countryId: 13, countryName: "Austria",
                          countryDescription: "description of austria", countryImage: "statistics"),
                         (continentId: 3, countryId: 14, countryName: "Ukraine",
                          countryDescription: "Ukraine has a fluctuating poverty line which was  US$5.5 per day in 2011 and had a 5.6% decrease in 2016, again a 3.4% in 2018 but an increase of 2.5% in 2019. Based on national data, the poverty threshold became higher, with 23% of the population living below the Subsistence Minimum, which is the minimum level of income, considered to be necessary to ensure sustenance and other basic personal needs at a level allowing the individual to survive.\n\nDuring the COVID-19 pandemic, the GDP of Ukraine shrinked by 4%, significantly the economic activity. Poverty measured SM remained unchanged at the 23% it was in, and with the increasing growth of the average disposable incomes, it suggests that the poorest households are holding the most burden from the pandemic’s impact.", countryImage: "statistics"),
                         (continentId: 3, countryId: 15, countryName: "Hungary",
                          countryDescription: "description of hungary", countryImage: "statistics"),
                         
                         (continentId: 4, countryId: 16, countryName: "United States of America",
                          countryDescription: "description of USA", countryImage: "statistics"),
                         (continentId: 4, countryId: 17, countryName: "Canada",
                          countryDescription: "description canada", countryImage: "statistics"),
                         (continentId: 4, countryId: 18, countryName: "Mexico",
                          countryDescription: "description of mexico", countryImage: "statistics"),
                         (continentId: 4, countryId: 19, countryName: "Jamaica",
                          countryDescription: "description of jamaica", countryImage: "statistics"),
                         (continentId: 4, countryId: 20, countryName: "Haita",
                          countryDescription: "description of Haiti", countryImage: "statistics"),
                         
                         (continentId: 5, countryId: 21, countryName: "Chile",
                          countryDescription: "To begin with, Chile was having a growth in development as the poverty line, which was US$5.5 a day, dropped from 6.6 to 3.6% and the middle class grew from 52 to 62%. The inequality of the Gini index fell from 45.8 to 44.4%. Nonetheless, inequality remained high in comparison with OECD countries. Income insecurity, and a growing sense of discontent with the welfare system led to widespread social unrest in late 2019, prior to COVID-19. Nonetheless, inequality remained high.\n\nIn 2020, the COVID-19 had worsened the pre-existing inequalities and vulnerability of the Chilean lower-middle-class to poverty and worse. Although poverty slightly increased to 4.4 percent in 2020, national poverty rose to 10.8 percent.", countryImage: "ChileImage"),
                         (continentId: 5, countryId: 22, countryName: "Argentina",
                          countryDescription: "description of argentina", countryImage: "statistics"),
                         (continentId: 5, countryId: 23, countryName: "Brazil",
                          countryDescription: "description of brazil", countryImage: "statistics"),
                         (continentId: 5, countryId: 24, countryName: "Peru",
                          countryDescription: "description of peru", countryImage: "statistics"),
                         (continentId: 5, countryId: 25, countryName: "Colombia",
                          countryDescription: "In 2017, the National Administrative Department of Statistics or, DANE, surveyed and reported that a whopping 26.9% were living below the poverty line, and within this, 7.4% are in “extreme poverty”. As per the World Bank brief of Latin America & the Caribbean (databank.org), the poverty rate had increased from 34.7% in 2018 to 35.7% in 2019, resulting in an additional 662,000 thousand people falling into poverty.The Gini coefficient shows an inequality of the currency of a continued upward trend to 52.7 in 2019, causing export prices to drop and import prices to hike, damaging the bottom 40% of households in Colombia.\n\nDuring the pandemic, Colombia has faced a great loss, with about 2.5 million jobs lost in 2020. The new unemployment percentage was 50% more than the original one, leading to 15.9% of the population, mainly of  women, youth, self-employed, and workers in small firms. Hours billed for individuals started declining, with the number of people working less than 20 hours a week increased from 15% to 20%, causing household incomes to decrease drastically and important necessities were becoming scarce, from food security, access to health services to quality education, and potentially damaged human capital and productivity.", countryImage: "ColombiaImage")
        ]
        
        for country in countries {
            let newCountry = NSEntityDescription.insertNewObject(forEntityName: "Country", into: context) as! Country
            newCountry.continentId = Int16(country.continentId)
            newCountry.countryId = Int16(country.countryId)
            newCountry.countryName = country.countryName
            newCountry.countryDescription = country.countryDescription
            newCountry.countryImage = country.countryImage
        }
        do {
            try context.save()
        }
        catch let error {
            print("the error is in seedCountries \(error.localizedDescription)")
        }
        
        
    }
}

