//
//  ViewController.swift
//  CodeTest
//
//  Created by Thazin Nwe on 20/08/2024.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var activityIndicator : UIActivityIndicatorView!
    
    var authorList:[Author] = []
    var currentPageNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        activityIndicator.hidesWhenStopped = true
        
        getAuthorList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func getAuthorList(){
        
        activityIndicator.startAnimating()
        APIManager.share.getAuthor(page: currentPageNumber) { results in
            
            self.activityIndicator.stopAnimating()
            if (results.count>0){
                if (self.currentPageNumber == 1){
                    self.authorList = results
                    self.collectionView.reloadData()
                }
                else
                {
                    
                    self.authorList.append(contentsOf: results)
                    self.collectionView.reloadData()
                }
            }
            
        }
    }


}


extension MainViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return authorList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return getCellSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if (indexPath.row == authorList.count - 1){
            currentPageNumber = currentPageNumber + 1
            getAuthorList()
        }
        
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let author = authorList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthorCell", for: indexPath) as! AuthorCell
        
        cell.configCell(author: author, targetSize: getCellSize())
        cell.backgroundColor = .lightGray
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let author = authorList[indexPath.row]
        if let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailVC.author = author
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
       
    }
    
    func getCellSize() -> CGSize{
        
        let width = (self.view.frame.width-10) / 3
        let height = width * 0.7
        return CGSize(width: width, height: height)
    }
   
}
