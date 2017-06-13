//
//  ViewController.swift
//  InAppPurchases
//
//  Created by Boxuan Zhu on 6/11/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit
import StoreKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var products = [SKProduct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        requestProducts()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func requestProducts() {
        let ids: Set<String> = ["com.developes.InAppPurchase.tier5","com.developes.InAppPurchase.tier7", "com.developes.InAppPurchase.tier8", "com.developes.InAppPurchase.tier9", "com.developes.InAppPurchase.tier10"]
        let productsRequest = SKProductsRequest(productIdentifiers: ids)
        productsRequest.delegate = self
        productsRequest.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("Products ready: \(response.products.count)")
        print("Products not ready : \(response.invalidProductIdentifiers.count)")
        products = response.products
        collectionView.reloadData()
        for product in products {
            print(product.productIdentifier)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cellPrice = ""
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "purchaseCell", for: indexPath) as? PurchaseCell{
            let product = products[indexPath.row]
            let formatter = NumberFormatter()
            formatter.numberStyle = NumberFormatter.Style.currency
            formatter.locale = product.priceLocale
            if let price = formatter.string(from: product.price){
                cellPrice = "\(price)"
            }
            cell.configCell(imageName: products[indexPath.row].productIdentifier, price: cellPrice)
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.size.width/2 - 20, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // action when cell is tapped
        SKPaymentQueue.default().add(self)
        let payment = SKMutablePayment(product: products[indexPath.row])
        payment.simulatesAskToBuyInSandbox = true
        SKPaymentQueue.default().add(payment)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions{
            switch transaction.transactionState {
            case .purchased:
                print("purchased")
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .failed:
                print("failed")
                let errMsg: String! = transaction.error?.localizedDescription
                showErrorAlert(title: "Oops! Something went wrog.", msg: "Unable to make Purchase. Reason: \(errMsg)")
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .restored:
                print("restored")
                showErrorAlert(title: "Purchase restored", msg: "Your purchases have been restored")
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .purchasing:
                print("purchasing")
                break
            case .deferred:
                print("deferred")
                break
            }
        }
    }
    
    func showErrorAlert(title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func restoreBtnPressed(_ sender: Any) {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}

