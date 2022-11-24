import { Controller } from "@hotwired/stimulus"
import { get} from "@rails/request.js"

export default class extends Controller {
  static targets = ["timeSelect","tableSelect"]
  change(event){
    let date=event.target.value
    let target=this.timeSelectTarget.id
    get(`/bookings/select_date?target=${target}&date=${date}`,{
      responseKind: "turbo-stream"
    })
  }


  table(event){
    let booked_date=document.getElementById("booking_day").value
    let booked_time=event.target.value
    let target= this.tableSelectTarget.id
    get(`/bookings/select_time?target=${target}&date=${booked_date}&time=${booked_time}`,{
      responseKind: "turbo-stream"
    })
  }
  

}


