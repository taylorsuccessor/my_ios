/*__________________________________________View  pressent*/

let storyboard = UIStoryboard(name: "Layout", bundle: nil)
let controller = storyboard.instantiateViewController(withIdentifier: "Layout.SideMenuView")
self.present(controller, animated: true, completion: nil)
/*________________________________________END__View  pressent*/


/*_________________________________________tableView*/

//insert row
tableView.beginUpdates()
tableView.insertRows(at: [IndexPath(row: (self.dataArray?.results?.count)! - 1 , section: 0)], with: .automatic)
tableView.endUpdates()

/*_____________________________________END____tableView*/
