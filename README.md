# Simple Health Tracker

## Project Description

The Simple Health Tracker is a decentralized health monitoring application built on the Stacks blockchain using Clarity smart contracts. This project enables users to securely record and track their personal health metrics including weight, height, and daily step count. All health data is stored immutably on the blockchain, ensuring data integrity and user ownership of their personal health information.

The smart contract provides a simple yet effective way for individuals to maintain a permanent, tamper-proof record of their health journey while maintaining complete control over their data privacy and access permissions.

## Project Vision

Our vision is to revolutionize personal health data management by leveraging blockchain technology to create a secure, decentralized, and user-controlled health tracking ecosystem. We aim to:

- **Data Ownership**: Empower users with complete control over their health data
- **Privacy First**: Ensure health information remains private and accessible only to authorized parties
- **Immutable Records**: Create permanent, unchangeable health records for long-term tracking
- **Decentralized Healthcare**: Contribute to a future where healthcare data is not controlled by centralized entities
- **Global Accessibility**: Provide health tracking tools accessible to anyone with internet access
- **Interoperability**: Build foundations for health data sharing across different healthcare providers and systems

## Future Scope - 

### Phase 1 - Enhanced Metrics
- Add support for additional health metrics (blood pressure, heart rate, BMI calculation)
- Implement health goal setting and progress tracking
- Add medication tracking and reminders

### Phase 2 - Social Features
- Friend connections and health challenges
- Anonymous community health statistics
- Health achievement badges and rewards system

### Phase 3 - Healthcare Integration
- Doctor/healthcare provider access permissions
- Integration with IoT health devices (smartwatches, fitness trackers)
- Health report generation and export functionality

### Phase 4 - Advanced Analytics
- AI-powered health insights and recommendations
- Predictive health analytics
- Integration with telemedicine platforms

### Phase 5 - Ecosystem Expansion
- Cross-chain compatibility
- Health data marketplace (anonymous, user-controlled)
- Insurance integration for wellness programs
- Research data contribution (with user consent)

## Contract Address

**Testnet Contract Address**: 
`STGPBEW1DRVNA80A863AYGPGNJ91SYNBYKTZK0QB.simple-health-tracker`

### Contract Functions

#### Public Functions:
- `record-health-data(weight, height, steps)` - Record personal health metrics
- `get-health-summary(user)` - Retrieve health data for a specific user

#### Read-Only Functions:
- `get-my-health-data()` - Get your own health data
- `get-total-users()` - Get total number of registered users
- `has-health-record(user)` - Check if a user has recorded health data

### Deployment Instructions :

1. Install Clarinet: `npm install -g @hirosystems/clarinet-cli`
2. Clone the repository
3. Navigate to project directory
4. Deploy to testnet: `clarinet deployments apply --devnet`
5. Test functions using Clarinet console

### Usage Example:

```clarity
;; Record health data
(contract-call? .simple-health-tracker record-health-data u70 u175 u8500)

;; Get your health summary
(contract-call? .simple-health-tracker get-my-health-data)
```

### Contributing:

We welcome contributions! Please feel free to submit issues, feature requests, or pull requests to help improve the Simple Health Tracker.

### License

This project is licensed under the MIT License - see the LICENSE file for details.# Simple-Health-Tracker-Contract
<img width="1422" alt="screenshot (2)" src="https://github.com/user-attachments/assets/720fa808-2c1c-47c1-b350-1ab05e7a4816" />
