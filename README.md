# Smart contractor contract 

<ol>
  <li>Constructor: input 3 wallet(employer,trused,contractor) </li>
  <li> 
 Pay:   The agreed amount will be paid and the status of the project will be paid by the employer. (Paid)
      <ul> 
          <li> Execute only when the contract status is not started. (not Stated) </li>
          <li> Only employer can run this function. </li>
          <li> Do not pay less than the agreed amount. </li>
      </ul>
  </li>
  <li> 
    Deposit: The guarantee amount agreed by the contractor will be paid and the status of the project will start
Has changed.(Started)
    <ul>
      <li> Only contractor can run this functino. </li>
      <li>Do not pay less than the agreed amount. </li>
      <li> Only applicable when the status of the contract Paid. </li>
    </ul>
  </li> 
  <li>  
    Confirm:Confirm or reject the delivery of the work, if confirmed, the status will be ended.
    <ul>
      <li> Only employer can run this function. </li>
      <li> Only applicable when the status of the contract Started. </li>
      <li> If the employer does not approve the situation if the agreed delivery time of the project has expired
Suspended mode changes. </li>
    </ul>
  </li>
  <li> Jugment: If approved by the trusted person, the status will be Ended and if rejected
failed.
  <ul> 
    <li> Only trusted can run this function. </li>
    <li>Only applicable when the status of the contract Supended. </li>
    
  </ul>
</li>
<li> 
  WithdrawContractor: Withdrawal of money by the contractor. 
  <ul>
    <li> Only contractor can run this function. </li>
    <li> Only applicable when the status of the contract Ended. </li>
  </ul>
  <li>WithdrawEmployer: Return of the principal deposit of the employer and losses.
    <ul> 
        <li>Only employer can run this function.</li>
        <li>Only applicable when the status of the contract Failed. </li>
    </ul>
    
  </li>
  
</li>
</ol>





