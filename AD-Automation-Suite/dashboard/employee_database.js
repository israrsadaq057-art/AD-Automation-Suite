// Complete Employee Database for Resource Academia
// Includes: Employee details, assets, attendance, faults

const employeeDatabase = {
    "Ahmed Hassan": {
        id: "EMP001",
        personal: {
            fullName: "Ahmed Hassan",
            username: "ahmed.hassan",
            email: "ahmed.hassan@resourceacademia.local",
            phone: "+92-51-1234567",
            personalPhone: "+92-300-1234567",
            emergencyContact: "Fatima Hassan (Wife): +92-300-7654321",
            address: "House #12, Street 5, F-10/3, Islamabad",
            dateOfBirth: "1985-03-15",
            nationality: "Pakistani",
            cnic: "12345-6789012-3",
            joinDate: "2020-01-15",
            department: "IT",
            position: "IT Director",
            manager: "CEO",
            employmentType: "Permanent",
            status: "Active",
            workAnniversary: "2026-01-15",
            lastPromotion: "2024-01-15"
        },
        assets: {
            laptop: { model: "Dell Precision 5560", serial: "DELL-5560-001", assigned: "2024-01-15", warrantyExpiry: "2027-01-15", status: "Active" },
            monitor: { model: "Dell U2723QE 27\" 4K", serial: "DELL-2723-001", assigned: "2024-01-15", status: "Active" },
            phone: { model: "iPhone 14 Pro", serial: "IPHONE-14P-001", phoneNumber: "+92-51-1234567", assigned: "2024-01-15", status: "Active" },
            accessories: [
                { name: "Dell Dock Station", serial: "DOCK-001", status: "Active" },
                { name: "Wireless Mouse", serial: "MOUSE-001", status: "Active" },
                { name: "Keyboard", serial: "KB-001", status: "Active" },
                { name: "Noise Cancelling Headset", serial: "HEAD-001", status: "Active" }
            ]
        },
        attendance: {
            january: { present: 20, absent: 1, leave: 1, vacation: 0, late: 0, total: 22 },
            february: { present: 19, absent: 0, leave: 1, vacation: 0, late: 0, total: 20 },
            march: { present: 18, absent: 0, leave: 2, vacation: 0, late: 1, total: 20 },
            yearly: { present: 57, absent: 1, leave: 4, vacation: 0, late: 1, total: 62 }
        },
        faultReports: []
    },
    "Fatima Ali": {
        id: "EMP002",
        personal: {
            fullName: "Fatima Ali",
            username: "fatima.ali",
            email: "fatima.ali@resourceacademia.local",
            phone: "+92-51-1234568",
            personalPhone: "+92-300-2345678",
            emergencyContact: "Ali Ahmed (Brother): +92-300-8765432",
            address: "Flat #5, Block B, G-11/2, Islamabad",
            dateOfBirth: "1990-07-22",
            nationality: "Pakistani",
            cnic: "12345-7890123-4",
            joinDate: "2021-03-01",
            department: "IT",
            position: "Network Administrator",
            manager: "Ahmed Hassan",
            employmentType: "Permanent",
            status: "Active",
            workAnniversary: "2026-03-01",
            lastPromotion: "2024-03-01"
        },
        assets: {
            laptop: { model: "MacBook Pro 14\" M2", serial: "MBP-14-002", assigned: "2023-03-01", warrantyExpiry: "2026-03-01", status: "Active" },
            monitor: { model: "LG 27\" 4K", serial: "LG-27-002", assigned: "2023-03-01", status: "Active" },
            phone: { model: "iPhone 14", serial: "IPHONE-14-002", phoneNumber: "+92-51-1234568", assigned: "2023-03-01", status: "Active" },
            accessories: [
                { name: "USB-C Hub", serial: "HUB-002", status: "Active" },
                { name: "Wireless Mouse", serial: "MOUSE-002", status: "Active" }
            ]
        },
        attendance: {
            january: { present: 21, absent: 0, leave: 1, vacation: 0, late: 0, total: 22 },
            february: { present: 20, absent: 0, leave: 0, vacation: 0, late: 0, total: 20 },
            march: { present: 19, absent: 0, leave: 1, vacation: 0, late: 0, total: 20 },
            yearly: { present: 60, absent: 0, leave: 2, vacation: 0, late: 0, total: 62 }
        },
        faultReports: [
            { date: "2026-02-10", asset: "Mouse", issue: "Not working", status: "Replaced", resolution: "New mouse provided" }
        ]
    },
    "Omar Khan": {
        id: "EMP003",
        personal: {
            fullName: "Omar Khan",
            username: "omar.khan",
            email: "omar.khan@resourceacademia.local",
            phone: "+92-51-1234569",
            personalPhone: "+92-300-3456789",
            emergencyContact: "Sara Khan (Wife): +92-300-9876543",
            address: "House #45, Street 12, DHA Phase II, Islamabad",
            dateOfBirth: "1988-11-10",
            nationality: "Pakistani",
            cnic: "12345-8901234-5",
            joinDate: "2021-06-15",
            department: "IT",
            position: "System Administrator",
            manager: "Ahmed Hassan",
            employmentType: "Permanent",
            status: "Active",
            workAnniversary: "2026-06-15",
            lastPromotion: "2024-06-15"
        },
        assets: {
            laptop: { model: "HP EliteBook 840 G8", serial: "HP-840-003", assigned: "2023-06-15", warrantyExpiry: "2026-06-15", status: "Active" },
            monitor: { model: "HP 27\"", serial: "HP-27-003", assigned: "2023-06-15", status: "Active" },
            phone: { model: "Samsung S23", serial: "S23-003", phoneNumber: "+92-51-1234569", assigned: "2023-06-15", status: "Active" },
            accessories: [
                { name: "Docking Station", serial: "DOCK-003", status: "Active" },
                { name: "Wireless Keyboard", serial: "KB-003", status: "Active" }
            ]
        },
        attendance: {
            january: { present: 20, absent: 1, leave: 1, vacation: 0, late: 1, total: 22 },
            february: { present: 18, absent: 1, leave: 1, vacation: 0, late: 1, total: 20 },
            march: { present: 17, absent: 1, leave: 2, vacation: 0, late: 1, total: 20 },
            yearly: { present: 55, absent: 3, leave: 4, vacation: 0, late: 3, total: 62 }
        },
        faultReports: []
    },
    "Sara Ahmed": {
        id: "EMP004",
        personal: {
            fullName: "Sara Ahmed",
            username: "sara.ahmed",
            email: "sara.ahmed@resourceacademia.local",
            phone: "+92-51-1234570",
            personalPhone: "+92-300-4567890",
            emergencyContact: "Ahmed Raza (Father): +92-300-1112223",
            address: "Apartment #7, E-11/3, Islamabad",
            dateOfBirth: "1992-09-05",
            nationality: "Pakistani",
            cnic: "12345-9012345-6",
            joinDate: "2022-01-10",
            department: "IT",
            position: "Help Desk Lead",
            manager: "Ahmed Hassan",
            employmentType: "Permanent",
            status: "Active",
            workAnniversary: "2026-01-10",
            lastPromotion: "2024-01-10"
        },
        assets: {
            laptop: { model: "Dell Latitude 7430", serial: "DELL-7430-004", assigned: "2024-01-10", warrantyExpiry: "2027-01-10", status: "Active" },
            monitor: { model: "Dell 24\"", serial: "DELL-24-004", assigned: "2024-01-10", status: "Active" },
            phone: { model: "iPhone 13", serial: "IPHONE-13-004", phoneNumber: "+92-51-1234570", assigned: "2024-01-10", status: "Active" },
            accessories: [
                { name: "Dell Dock", serial: "DOCK-004", status: "Active" },
                { name: "Wireless Mouse", serial: "MOUSE-004", status: "Active" }
            ]
        },
        attendance: {
            january: { present: 22, absent: 0, leave: 0, vacation: 0, late: 0, total: 22 },
            february: { present: 20, absent: 0, leave: 0, vacation: 0, late: 0, total: 20 },
            march: { present: 20, absent: 0, leave: 0, vacation: 0, late: 0, total: 20 },
            yearly: { present: 62, absent: 0, leave: 0, vacation: 0, late: 0, total: 62 }
        },
        faultReports: [
            { date: "2026-01-15", asset: "Laptop Battery", issue: "Battery draining fast", status: "Replaced", resolution: "New battery installed" }
        ]
    },
    "Usman Malik": {
        id: "EMP005",
        personal: {
            fullName: "Usman Malik",
            username: "usman.malik",
            email: "usman.malik@resourceacademia.local",
            phone: "+92-51-1234571",
            personalPhone: "+92-300-5678901",
            emergencyContact: "Zara Malik (Sister): +92-300-2223334",
            address: "House #23, Street 8, I-8/4, Islamabad",
            dateOfBirth: "1995-04-18",
            nationality: "Pakistani",
            cnic: "12345-0123456-7",
            joinDate: "2023-03-20",
            department: "IT",
            position: "Network Engineer",
            manager: "Fatima Ali",
            employmentType: "Probation",
            status: "Active",
            workAnniversary: "2026-03-20",
            lastPromotion: "2025-03-20"
        },
        assets: {
            laptop: { model: "Lenovo ThinkPad X1", serial: "LENOVO-X1-005", assigned: "2024-03-20", warrantyExpiry: "2027-03-20", status: "Active" },
            monitor: { model: "Lenovo 27\"", serial: "LENOVO-27-005", assigned: "2024-03-20", status: "Active" },
            phone: { model: "Google Pixel 7", serial: "PIXEL-7-005", phoneNumber: "+92-51-1234571", assigned: "2024-03-20", status: "Active" },
            accessories: [
                { name: "USB-C Hub", serial: "HUB-005", status: "Active" }
            ]
        },
        attendance: {
            january: { present: 19, absent: 2, leave: 1, vacation: 0, late: 2, total: 22 },
            february: { present: 17, absent: 2, leave: 1, vacation: 0, late: 1, total: 20 },
            march: { present: 16, absent: 2, leave: 2, vacation: 0, late: 2, total: 20 },
            yearly: { present: 52, absent: 6, leave: 4, vacation: 0, late: 5, total: 62 }
        },
        faultReports: []
    }
};

// Complete Asset Inventory
const assetInventory = {
    laptops: [
        { model: "Dell Precision 5560", serial: "DELL-5560-001", assignedTo: "Ahmed Hassan", status: "Active", warranty: "2027-01-15", purchaseDate: "2024-01-15", cost: "€2,500" },
        { model: "MacBook Pro 14\" M2", serial: "MBP-14-002", assignedTo: "Fatima Ali", status: "Active", warranty: "2026-03-01", purchaseDate: "2023-03-01", cost: "€2,800" },
        { model: "HP EliteBook 840 G8", serial: "HP-840-003", assignedTo: "Omar Khan", status: "Active", warranty: "2026-06-15", purchaseDate: "2023-06-15", cost: "€1,900" },
        { model: "Dell Latitude 7430", serial: "DELL-7430-004", assignedTo: "Sara Ahmed", status: "Active", warranty: "2027-01-10", purchaseDate: "2024-01-10", cost: "€2,100" },
        { model: "Lenovo ThinkPad X1", serial: "LENOVO-X1-005", assignedTo: "Usman Malik", status: "Active", warranty: "2027-03-20", purchaseDate: "2024-03-20", cost: "€2,300" }
    ],
    monitors: [
        { model: "Dell U2723QE 27\"", serial: "DELL-2723-001", assignedTo: "Ahmed Hassan", status: "Active" },
        { model: "LG 27\" 4K", serial: "LG-27-002", assignedTo: "Fatima Ali", status: "Active" },
        { model: "HP 27\"", serial: "HP-27-003", assignedTo: "Omar Khan", status: "Active" }
    ],
    phones: [
        { model: "iPhone 14 Pro", serial: "IPHONE-14P-001", assignedTo: "Ahmed Hassan", phoneNumber: "+92-51-1234567", status: "Active" },
        { model: "iPhone 14", serial: "IPHONE-14-002", assignedTo: "Fatima Ali", phoneNumber: "+92-51-1234568", status: "Active" },
        { model: "Samsung S23", serial: "S23-003", assignedTo: "Omar Khan", phoneNumber: "+92-51-1234569", status: "Active" }
    ],
    accessories: [
        { name: "Dell Dock Station", serial: "DOCK-001", assignedTo: "Ahmed Hassan", status: "Active" },
        { name: "Wireless Mouse", serial: "MOUSE-001", assignedTo: "Ahmed Hassan", status: "Active" },
        { name: "USB-C Hub", serial: "HUB-002", assignedTo: "Fatima Ali", status: "Active" }
    ]
};

// Fault Reports Database
const faultReports = [
    { id: "FR-001", date: "2026-02-10", reportedBy: "Fatima Ali", assetType: "Mouse", assetSerial: "MOUSE-002", issue: "Mouse not clicking properly", status: "Resolved", resolvedBy: "IT Support", resolution: "Replaced with new mouse", resolvedDate: "2026-02-11" },
    { id: "FR-002", date: "2026-01-15", reportedBy: "Sara Ahmed", assetType: "Laptop Battery", assetSerial: "DELL-7430-004", issue: "Battery draining fast (only 2 hours)", status: "Resolved", resolvedBy: "IT Support", resolution: "Battery replaced under warranty", resolvedDate: "2026-01-18" },
    { id: "FR-003", date: "2026-03-01", reportedBy: "Omar Khan", assetType: "Keyboard", assetSerial: "KB-003", issue: "Spacebar not working", status: "In Progress", resolvedBy: null, resolution: null, resolvedDate: null }
];

// Export for use in HTML
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { employeeDatabase, assetInventory, faultReports };
}